require 'yaml'
require 'docopt'

# make task description accessible within the task
Rake::TaskManager.record_task_metadata = true

###############################################################################
namespace :dsc do
  # local pathes
  dsc_build_path  = Pathname.new(__FILE__).dirname
  dsc_repo_url    = %x(git config --get remote.origin.url).strip
  dsc_repo_branch = %x(git rev-parse --abbrev-ref HEAD).strip
  dsc_manager = Dsc::Manager.new

  # config
  config_file = "#{dsc_build_path}/dsc.yml"
  if File.exists?(config_file)
    config = YAML::load(File.open("#{dsc_build_path}/dsc.yml"))
  else
    config = {}
  end

  default_dsc_module_path    = dsc_manager.module_path
  default_dsc_resources_path = dsc_manager.dsc_modules_folder
  dsc_resources_file         = dsc_manager.dsc_resources_file
  default_types_path         = "#{default_dsc_module_path}#{dsc_manager.puppet_type_subpath}"
  default_type_specs_path    = "#{default_dsc_module_path}#{dsc_manager.puppet_type_spec_subpath}"

  default_repository = config.has_key?('default_source_repository') ? config['default_source_repository'] : {}
  blacklist = config.has_key?('blacklist') ? config['blacklist'] : []

  desc <<-DOCOPT
Build Puppet types from DSC Resources

Usage:
  dsc:build -- \
[--target_module_location=PATH] \
[--source_repo_url=URL | --source_location=PATH] \
[--repo_branch=BRANCH] \
[--release_tag_prefix=PREFIX] \
[--release_tag_suffix=SUFFIX] \
[--update_versions] \
[--unembed_powershell_sources] \
[--base_only]

  dsc:build -- --help

Options:
  --target_module_location=PATH   path of the generated module
                                  this will build an external module
  --source_repo_url=URL           source Git repo url
  --repo_branch=BRANCH            source Git repo branch
  --release_tag_prefix=PREFIX     string prefixing the tag version
  --release_tag_suffix=SUFFIX     string suffixing the tag version
  --source_location=PATH          source location (local path)
                                  can be the path of a locally cloned git repo
  --update_versions               should the last version be used
  --unembed_powershell_sources    should the powershell sources be removed
                                  per default the sources are embedded
  --base_only                     only build base resources (skips the import)
DOCOPT
  task :build, [:params] do |t, args|

    # Generate parameters and values from description and args
    parameters = RakeTaskArguments.parse_description(
      t.name,
      t.full_comment,
      args[:params].nil? ? ARGV : args[:params]
    )

    # Setting params from config file
    parameters["source_repo_url"] = parameters["source_repo_url"] ||
      default_repository['url'] unless parameters["source_location"]
    parameters["repo_branch"] = parameters["repo_branch"] ||
      default_repository['branch']
    parameters["release_tag_suffix"] = parameters["release_tag_suffix"] ||
      default_repository['release_tag_suffix']
    parameters["update_versions"] = parameters["update_versions"].nil? ?
      default_repository['release_tag_suffix'] : parameters["update_versions"]
    parameters["unembed_powershell_sources"] = parameters["unembed_powershell_sources"].nil? ?
      default_repository['unembed_powershell_sources'] : parameters["unembed_powershell_sources"]

    if parameters["target_module_location"]
      RakeTaskArguments.execute_rake('dsc:module:skeleton', parameters.filter(
        :target_module_location,
        )
      )
    else
      RakeTaskArguments.execute_rake('dsc:resources:base', {})
    end

    if (parameters["source_repo_url"] || parameters["source_location"]) && !parameters["base_only"]
      RakeTaskArguments.execute_rake('dsc:resources:import', parameters)
    end

    RakeTaskArguments.execute_rake('dsc:resources:embed', parameters.filter(
      :target_module_location
      )
    ) unless parameters["unembed_powershell_sources"]

    RakeTaskArguments.execute_rake('dsc:types:clean', parameters.filter(
      :target_module_location
      )
    )

    RakeTaskArguments.execute_rake('dsc:types:build', parameters.filter(
      :target_module_location,
      :unembed_powershell_sources
      )
    )

    RakeTaskArguments.execute_rake('dsc:types:document', parameters.filter(
      :target_module_location
      )
    )

  end

desc <<-DOCOPT
Clean Puppet types and DSC Resources

Usage:
  dsc:clean -- \
[--target_module_location=PATH] \

  dsc:clean -- --help

Options:
  --target_module_location=PATH   path of the generated module

DOCOPT
  task :clean, [:params] do |t, args|

    # Generate parameters and values from description and args
    parameters = RakeTaskArguments.parse_description(
      t.name,
      t.full_comment,
      args[:params].nil? ? ARGV : args[:params]
    )

    RakeTaskArguments.execute_rake('dsc:types:clean', parameters.filter(
      :target_module_location
      )
    )

    RakeTaskArguments.execute_rake('dsc:resources:clean', parameters.filter(
      :target_module_location
      )
    )
  end

  #############################################################################
  namespace :resources do
    item_name = 'DSC Powershell modules files'


    desc <<-DOCOPT
Include base DSC resources (the windows native resources)

Usage:
  dsc:base
  dsc:base -- --help

DOCOPT
    task :base do |t|
      puts "Copying vendored base resources from #{default_dsc_module_path}/build/vendor/wmf_dsc_resources to #{default_dsc_resources_path}"
      FileUtils.mkdir_p(default_dsc_resources_path) unless File.directory?(default_dsc_resources_path)
      FileUtils.cp_r "#{default_dsc_module_path}/build/vendor/wmf_dsc_resources/.", "#{default_dsc_resources_path}/"
    end

  desc <<-DOCOPT
Import #{item_name}

Usage:
  dsc:resources:import -- \
[--target_module_location=PATH] \
[--source_repo_url=URL | --source_location=PATH] \
[--repo_branch=BRANCH] \
[--release_tag_prefix=PREFIX] \
[--release_tag_suffix=SUFFIX] \
[--update_versions] \
[--unembed_powershell_sources] \

  dsc:resources:import -- --help

Options:
  --target_module_location=PATH   path of the generated module
                                  this will build an external module
  --source_repo_url=URL           source Git repo url
  --repo_branch=BRANCH            source Git repo branch
  --release_tag_prefix=PREFIX     string prefixing the tag version
  --release_tag_suffix=SUFFIX     string suffixing the tag version
  --source_location=PATH          source location (local path)
                                  can be the path of a locally cloned git repo
  --update_versions               should the last version be used
  --unembed_powershell_sources    should the powershell sources be removed
                                  per default the sources are embedded

DOCOPT
    task :import, [:params] do |t, args|

      # Generate parameters and values from description and args
      parameters = RakeTaskArguments.parse_description(
        t.name,
        t.full_comment,
        args[:params].nil? ? ARGV : args[:params]
      )

      target_module_location     = parameters["target_module_location"]
      source_repo_url            = parameters["source_repo_url"]
      source_location            = parameters["source_location"]
      repo_branch                = parameters["repo_branch"] || 'master'
      release_tag_prefix         = parameters["release_tag_prefix"]
      release_tag_suffix         = parameters["release_tag_suffix"]
      update_versions            = parameters["update_versions"]

      dsc_resources_path         = default_dsc_resources_path
      dsc_resources_path_tmp     = "#{dsc_resources_path}_tmp"

      puts "Importing #{item_name}"

      # clone
      unless Dir.exist? dsc_resources_path_tmp
        if parameters["source_repo_url"]
          mod_name = source_repo_url.split('/').last.split('.').first
          clone_cmd = "git clone -b #{repo_branch} #{source_repo_url} #{dsc_resources_path_tmp}"
          sh clone_cmd
          is_git_repo = true
        elsif parameters["source_location"]
          mod_name = source_location.split('/').last
          FileUtils.cp_r "#{parameters["source_location"]}", "#{dsc_resources_path_tmp}"
          is_git_repo = File.exists? File.expand_path("#{parameters["source_location"]}/.git")
        end
      end

      if is_git_repo
        # Process git repository
        sub_cmd = "git -C #{dsc_resources_path_tmp} submodule"
        submodules_strings = `#{sub_cmd}`

        submodules = submodules_strings.split("\n").collect{ |s| {
            :commit => s.split(' ')[0],
            :path   => s.split(' ')[1],
            :name   => s.split(' ')[1].split('/').last,
            :tag    => s.split(' ')[2]
          }
        }

        post_cmd = ''
        post_cmd += "git -C #{dsc_resources_path_tmp} checkout #{ENV['DSC_REF']}\n" if ENV['DSC_REF']
        post_cmd += "git -C #{dsc_resources_path_tmp} submodule update --init" if submodules.any?
        sh post_cmd if !post_cmd.empty?

        # Without submodules, we assume that this is a standalone dsc module
        # and process it as it was a submodule.
        if submodules.empty?
          submodules = [{
            :commit => nil,
            :path   => nil,
            :name   => mod_name,
            :tag    => nil
          }]
        end

        puts "Cleaning out black-listed DSC resources: #{blacklist}"
        blacklisted_submodules = submodules.select { |sm| blacklist.include?(sm[:name])}

        # remove blacklisted modules form submodules array for further processing
        submodules = submodules - blacklisted_submodules

        # remove blacklisted module from disk
        blacklisted_submodules.each do |bsm|
            FileUtils.rm_rf("#{dsc_resources_path_tmp}/#{bsm[:path]}")
        end

		puts "Setting release tags/commit for DSC resources..."
        dsc_manager.ensure_versions(submodules, update_versions, release_tag_prefix, release_tag_suffix)

      else
        # Process a directory which is not a git repository
        submodules = [{
          :commit => nil,
          :path   => nil,
          :name   => mod_name,
          :tag    => nil
        }]
      end

      FileUtils.rm_rf(Dir["#{dsc_resources_path_tmp}/**/.git"])

      puts "Cleaning out test and example files for #{item_name}"
      FileUtils.rm_rf(Dir["#{dsc_resources_path_tmp}/**/*[Ss]ample*",
                          "#{dsc_resources_path_tmp}/**/*[Ee]xample*",
                          "#{dsc_resources_path_tmp}/**/*[Tt]est*"])

      puts "Cleaning out extraneous files for #{item_name}"
      FileUtils.rm_rf(Dir["#{dsc_resources_path_tmp}/**/.{gitattributes,gitignore,gitmodules}"])
      FileUtils.rm_rf(Dir["#{dsc_resources_path_tmp}/**/*.{pptx,docx,sln,cmd,xml,pssproj,pfx,html,txt,xlsm,csv,png,git,yml,md}"])

      # make sure dsc_resources folder exists in import
      FileUtils.mkdir_p(dsc_resources_path) unless File.directory?(dsc_resources_path)

      submodules.each do |submodule|
        submodule_abs_path = dsc_resources_path_tmp
        submodule_abs_path += "/#{submodule[:path]}" if submodule[:path]
        puts "Copying vendored resources from #{submodule_abs_path} to #{dsc_resources_path}/#{submodule[:name]}"
        FileUtils.cp_r "#{submodule_abs_path}/.", "#{dsc_resources_path}/#{submodule[:name]}", :remove_destination => true,:verbose =>true
      end

      puts "Removing extra dir #{dsc_resources_path_tmp}"
      FileUtils.rm_rf "#{dsc_resources_path_tmp}"
    end

    desc <<-DOCOPT
Embed #{item_name}

Usage:
  dsc:resources:embed -- \
[--target_module_location=PATH] \

  dsc:resources:embed -- --help

Options:
  --target_module_location=PATH   path of the generated module

DOCOPT
      task :embed, [:params] do |t, args|
      # Generate parameters and values from description and args
      parameters = RakeTaskArguments.parse_description(
        t.name,
        t.full_comment,
        args[:params].nil? ? ARGV : args[:params]
      )

      module_path = parameters["target_module_location"] || default_dsc_module_path
      vendor_dsc_resources_path = "#{module_path}/lib/puppet_x/dsc_resources"
      puts "Copying vendored resources from '#{default_dsc_resources_path}/.' to '#{vendor_dsc_resources_path}'"
      # make sure dsc_resources folder exists in puppetx
      FileUtils.mkdir_p(vendor_dsc_resources_path) unless File.directory?(vendor_dsc_resources_path)
      # exclude the base resources 'PSDesiredStateConfiguration' from the sync
      resources_list = Dir["#{default_dsc_resources_path}/*"].reject do |file_path|
        file_path =~ /^#{default_dsc_resources_path}\/PSDesiredStateConfiguration$/
      end
      FileUtils.cp_r resources_list, vendor_dsc_resources_path, :remove_destination => true
    end

    desc <<-DOCOPT
Cleanup #{item_name}

Usage:
  dsc:clean -- \
[--target_module_location=PATH] \

  dsc:clean -- --help

Options:
  --target_module_location=PATH   path of the generated module

DOCOPT
    task :clean, [:params] do |t, args|

      # Generate parameters and values from description and args
      parameters = RakeTaskArguments.parse_description(
        t.name,
        t.full_comment,
        args[:params].nil? ? ARGV : args[:params]
      )

      module_path = parameters["target_module_location"] || default_dsc_module_path
      vendor_dsc_resources_path = "#{module_path}/lib/puppet_x/dsc_resources"
      puts "Cleaning #{item_name}"
      FileUtils.rm_rf "#{default_dsc_module_path}/import"
      FileUtils.rm_rf "#{vendor_dsc_resources_path}"
    end

  end

  #############################################################################
  namespace :types do
    item_name = 'DSC types and type specs'

    desc <<-DOCOPT
Build #{item_name}

Usage:
  dsc:types:build -- \
[--target_module_location=PATH] \
[--unembed_powershell_sources] \

  dsc:types:build -- --help

Options:
  --target_module_location=PATH   path of the generated module
  --unembed_powershell_sources    should the powershell sources be removed
                                  per default the sources are embedded
DOCOPT
    task :build, [:params] do |t, args|

      # Generate parameters and values from description and args
      parameters = RakeTaskArguments.parse_description(
        t.name,
        t.full_comment,
        args[:params].nil? ? ARGV : args[:params]
      )

      module_path = parameters["target_module_location"] || default_dsc_module_path
      unembed_powershell_sources = parameters["unembed_powershell_sources"]

      dsc_manager.dsc_modules_embedded = !unembed_powershell_sources
      wait_for_resources = Dir["#{module_path}/**/MSFT_WaitFor*"]
      fail "MSFT_WaitFor* resources found - aborting type building! Please remove the following MSFT_WaitFor* DSC Resources and run the build again.\n\n#{wait_for_resources}\n" if !wait_for_resources.empty?
      dsc_manager.target_module_location = module_path
      msgs = dsc_manager.build_dsc_types
      msgs.each{|m| puts "#{m}"}
    end

    desc <<-DOCOPT
Document #{item_name}

Usage:
  dsc:types:document -- \
[--target_module_location=PATH] \

  dsc:types:document -- --help

Options:
  --target_module_location=PATH   path of the generated module

DOCOPT
    task :document, [:params] do |t, args|

      # Generate parameters and values from description and args
      parameters = RakeTaskArguments.parse_description(
        t.name,
        t.full_comment,
        args[:params].nil? ? ARGV : args[:params]
      )

      module_path = parameters["target_module_location"] || default_dsc_module_path
      dsc_manager.target_module_location = module_path
      dsc_manager.document_types("#{module_path}/types.md", dsc_manager.get_dsc_types)
    end

    desc <<-DOCOPT
Cleanup #{item_name}

Usage:
  dsc:types:clean -- \
[--target_module_location=PATH] \

  dsc:types:clean -- --help

Options:
  --target_module_location=PATH   path of the generated module

DOCOPT
    task :clean, [:params] do |t, args|

      # Generate parameters and values from description and args
      parameters = RakeTaskArguments.parse_description(
        t.name,
        t.full_comment,
        args[:params].nil? ? ARGV : args[:params]
      )

      module_path = parameters["target_module_location"] || default_dsc_module_path
      puts "Cleaning #{item_name}"
      dsc_manager.target_module_location = module_path
      msgs = dsc_manager.clean_dsc_types
      msgs.each{|m| puts "#{m}"}
      msgs = dsc_manager.clean_dsc_type_specs
      msgs.each{|m| puts "#{m}"}
      FileUtils.rm_rf "#{default_dsc_module_path}/types.md"
    end

  end

  #############################################################################
  namespace :module do
    item_name = 'External DSC module'

    desc <<-DOCOPT
Generate skeleton for #{item_name}

Usage:
  dsc:module:skeleton -- \
[--target_module_location=PATH] \

  dsc:module:skeleton -- --help

Options:
  --target_module_location=PATH   path of the generated module

DOCOPT
    task :skeleton, [:params] do |t, args|

      # Generate parameters and values from description and args
      parameters = RakeTaskArguments.parse_description(
        t.name,
        t.full_comment,
        args[:params].nil? ? ARGV : args[:params]
      )

      dsc_module_path = parameters["target_module_location"] || default_dsc_module_path
      module_name = Pathname.new(dsc_module_path).basename.to_s
      ext_module_files = [
        '.gitignore',
        '.pmtignore',
        'LICENSE',
        'README.md',
        'Repofile',
        'spec/*.rb',
      ]
      ext_module_files.each do |module_pathes|
        Dir[module_pathes].each do |path|
          if File.directory?(path)
            full_path = "#{dsc_module_path}/#{path}"
            unless File.exists?(full_path)
              puts "Creating directory #{full_path}"
              FileUtils.mkdir_p(full_path)
            end
          else
            directory = Pathname.new(path).dirname
            full_directory_path = "#{dsc_module_path}/#{directory}"
            full_path = "#{dsc_module_path}/#{path}"
            unless File.exists?(full_directory_path)
              puts "Creating directory #{full_directory_path}"
              FileUtils.mkdir_p(full_directory_path)
            end
            unless File.exists?(full_path)
              puts "Copying file #{path} to #{full_path}"
              FileUtils.cp(path, full_path)
            end
          end
        end
      end

      unless File.exists?("#{dsc_module_path}/Puppetfile")
        puts "Creating #{dsc_module_path}/Puppetfile"
        # Generate Puppetfile with dependency on this dsc module
        Puppetfile_content = <<-eos
forge "https://forgeapi.puppetlabs.com"
mod '#{dsc_build_path.parent.basename}', :git => '#{dsc_repo_url}', :ref => '#{dsc_repo_branch}'
eos
       File.open("#{dsc_module_path}/Puppetfile", 'w') do |file|
          file.write Puppetfile_content
        end
      end

      # Generate metadata.json
      unless File.exists?("#{dsc_module_path}/metadata.json")
        puts "Creating #{dsc_module_path}/metadata.json"
        root_dsc_metadata = JSON.parse(File.read('metadata.json'))
        module_metadata = {}
        module_metadata["name"] = module_name
        module_metadata["tags"] = root_dsc_metadata["tags"]
        module_metadata["operatingsystem_support"] = root_dsc_metadata["operatingsystem_support"]
        module_metadata["requirements"] = root_dsc_metadata["requirements"]
        module_metadata["dependencies"] = [
          {
            "name"=> root_dsc_metadata['name'].sub('-','/'),
            "version_requirement" => root_dsc_metadata['version']
          }
        ]
        File.open("#{dsc_module_path}/metadata.json", 'w') do |file|
          file.write JSON.pretty_generate(module_metadata)
        end
      end

      # Generate Gemfile without any groups
      unless File.exists?("#{dsc_module_path}/Gemfile")
        puts "Creating #{dsc_module_path}/Gemfile"
        Gemfile_content = File.read('Gemfile')
        File.open("#{dsc_module_path}/Gemfile", 'w') do |file|
          #file.write Gemfile_content.gsub(/^group.*^end$/m,'')
          file.write Gemfile_content
        end
      end

      # Generate Rakefile
      unless File.exists?("#{dsc_module_path}/Rakefile")
        puts "Creating #{dsc_module_path}/Rakefile"
        Rakefile_content = File.read('Rakefile')
        File.open("#{dsc_module_path}/Rakefile", 'w') do |file|
          file.write Rakefile_content.gsub(/\/spec\/fixtures\/modules\/dsc/, "/spec/fixtures/modules/#{module_name.split('-').last}")
        end
      end

    end

  end

end
