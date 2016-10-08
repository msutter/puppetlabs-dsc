require 'yaml'

# make task description accessible within the task
Rake::TaskManager.record_task_metadata = true

###############################################################################
namespace :dsc do
  # local pathes
  dsc_build_path  = Pathname.new(__FILE__).dirname
  dsc_repo_url    = %x(git config --get remote.origin.url).strip
  dsc_repo_branch = %x(git rev-parse --abbrev-ref HEAD).strip

  # config
  config_file = "#{dsc_build_path}/dsc.yml"
  if File.exists?(config_file)
    config = YAML::load(File.open("#{dsc_build_path}/dsc.yml"))
  else
    config = {}
  end

  # default_dsc_module_path    = dsc_manager.module_path
  # default_dsc_resources_path = dsc_manager.dsc_modules_folder

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
  dsc:resources:base
  dsc:resources:base -- --help

DOCOPT
    task :base do |t|
      dsc_manager = Dsc::Manager.new()
      dsc_manager.resources_import_base
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

      dsc_manager = Dsc::Manager.new(parameters["target_module_location"])
      dsc_manager.dsc_modules_embedded = !parameters["unembed_powershell_sources"]

      source_repo_url            = parameters["source_repo_url"]
      source_location            = parameters["source_location"]
      repo_branch                = parameters["repo_branch"] || 'master'
      release_tag_prefix         = parameters["release_tag_prefix"]
      release_tag_suffix         = parameters["release_tag_suffix"]
      update_versions            = parameters["update_versions"]

      dsc_resources_path         = dsc_manager.dsc_modules_folder
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
      dsc_manager = Dsc::Manager.new(parameters["target_module_location"])
      dsc_manager.resources_embed
    end

    desc <<-DOCOPT
Cleanup #{item_name}

Usage:
  dsc:resources:clean -- \
[--target_module_location=PATH] \

  dsc:resources:clean -- --help

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

      dsc_manager = Dsc::Manager.new(parameters["target_module_location"])
      puts "Cleaning #{item_name}"
      dsc_manager.resources_clean
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

      dsc_manager = Dsc::Manager.new(parameters["target_module_location"])
      dsc_manager.dsc_modules_embedded = !parameters["unembed_powershell_sources"]

      wait_for_resources = Dir["#{dsc_manager.module_path}/**/MSFT_WaitFor*"]
      fail "MSFT_WaitFor* resources found - aborting type building! Please remove the following MSFT_WaitFor* DSC Resources and run the build again.\n\n#{wait_for_resources}\n" if !wait_for_resources.empty?
      dsc_manager.build_dsc_types
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

      dsc_manager = Dsc::Manager.new(parameters["target_module_location"])
      dsc_manager.document_types
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

      dsc_manager = Dsc::Manager.new(parameters["target_module_location"])

      puts "Cleaning #{item_name}"
      msgs = dsc_manager.clean_dsc_types
      msgs = dsc_manager.clean_dsc_type_specs
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

      dsc_manager = Dsc::Manager.new(parameters["target_module_location"])
      dsc_manager.module_skeleton
    end

  end

end
