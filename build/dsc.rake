require 'yaml'

class String
  def to_bool
    return true   if self == true   || self =~ (/(true|t|yes|y|1)$/i)
    return false  if self == false  || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end

namespace :dsc do

  # local pathes
  dsc_build_path             = Pathname.new(__FILE__).dirname
  dsc_repo_url               = %x(git config --get remote.origin.url).strip
  dsc_repo_branch            = %x(git rev-parse --abbrev-ref HEAD).strip

  # config
  config_file = "#{dsc_build_path}/dsc.yml"
  if File.exists?(config_file)
    config = YAML::load(File.open("#{dsc_build_path}/dsc.yml"))
    puts "Using values from config file #{config_file}"
  else
    puts "Config file #{config_file} not found"
    puts "Using default values"
    config = {}
  end

  # defaults
  default_dsc_module_path    = dsc_build_path.parent
  default_dsc_resources_path = "#{default_dsc_module_path}/import/dsc_resources"
  default_types_path         = "#{default_dsc_module_path}/lib/puppet/type"
  default_type_specs_path    = "#{default_dsc_module_path}/spec/unit/puppet/type"
  dsc_resources_file         = "#{default_dsc_module_path}/dsc_resource_release_tags.yml"
  dsc_central_repo_url       = 'https://github.com/PowerShell/DscResources.git'
  dsc_central_repo_branch    = 'master'
  blacklist                  = ["xChrome", "xDSCResourceDesigner", "xDscDiagnostics", "xFirefox", "xSafeHarbor", "xSystemSecurity"]
  embedded_posh_modules      = true

  # overwrite defaults with config file values if they exists
  if config.has_key?('central_repository')
    dsc_central_repo_url              = config['central_repository']['url'] if config['central_repository'].has_key?('url')
    dsc_central_repo_branch           = config['central_repository']['branch'] if config['central_repository'].has_key?('branch')
  end

  if config.has_key?('blacklist')
    blacklist = config['blacklist']
  end

  if config.has_key?('embedded_posh_modules')
    embedded_posh_modules = config['embedded_posh_modules']
  end

  desc "Build Resources from Central repository for PowerShell Desired State Configuration"
  task :build, [:dsc_module_path, :central_repo_url, :repo_branch, :embedded_posh_modules, :update_versions] do |t, args|

    dsc_module_path       = args[:dsc_module_path] || default_dsc_module_path
    central_repo_url      = args[:central_repo_url] || dsc_central_repo_url
    repo_branch           = args[:repo_branch] || dsc_central_repo_branch
    embedded_posh_modules = args[:embedded_posh_modules].nil? ? embedded_posh_modules : args[:embedded_posh_modules].to_bool
    update_versions       = (args[:update_versions] || 'false').to_bool

    if args[:dsc_module_path]
      Rake::Task['dsc:module:skeleton'].invoke(dsc_module_path)
    else
      Rake::Task['dsc:resources:base'].invoke()
    end

    # TODO
    Rake::Task['dsc:resources:import'].invoke(
      central_repo_url,
      repo_branch,
      update_versions,
      )
      # ) unless File.exists?(default_dsc_resources_path)

    Rake::Task['dsc:resources:embed'].invoke(dsc_module_path) if embedded_posh_modules
    Rake::Task['dsc:types:clean'].invoke(dsc_module_path)
    Rake::Task['dsc:types:build'].invoke(dsc_module_path)
    Rake::Task['dsc:types:document'].invoke(dsc_module_path)
  end

  desc "Cleanup all"
  task :clean, [:dsc_module_path] do |t, args|
    dsc_module_path = args[:dsc_module_path] || default_dsc_module_path
    Rake::Task['dsc:types:clean'].invoke(dsc_module_path)
    Rake::Task['dsc:resources:clean'].invoke(dsc_module_path)
  end

  namespace :resources do

    item_name = 'DSC Powershell modules files'

    desc <<-eod
    Base #{item_name}
eod

    task :base do |t|
      puts "Copying vendored base resources from #{default_dsc_module_path}/build/vendor/wmf_dsc_resources to #{default_dsc_resources_path}"
      FileUtils.mkdir_p(default_dsc_resources_path) unless File.directory?(default_dsc_resources_path)
      FileUtils.cp_r "#{default_dsc_module_path}/build/vendor/wmf_dsc_resources/.", "#{default_dsc_resources_path}/"
    end

    desc <<-eod
    Import #{item_name}

Default values:
  dsc_resources_path: #{default_dsc_resources_path}
eod

    task :import, [:central_repo_url, :repo_branch, :update_versions] do |t, args|
      dsc_resources_path = args[:dsc_resources_path] || default_dsc_resources_path
      dsc_resources_path = File.expand_path(dsc_resources_path)
      dsc_resources_path_tmp = "#{dsc_resources_path}_tmp"
      update_versions = args[:update_versions] ? args[:update_versions] :  false

      central_repo_url      = args[:central_repo_url]
      repo_branch           = args[:repo_branch]

      is_custom_resource = (dsc_central_repo_url != central_repo_url)

      puts "Downloading and Importing #{item_name}"

      # clone
      unless Dir.exist? dsc_resources_path_tmp
        clone_cmd = "git clone -b #{repo_branch} #{central_repo_url} #{dsc_resources_path_tmp}"
        sh clone_cmd
      end

      mod_name = central_repo_url.split('/').last.split('.').first

      # get submodules
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

      # check if this is a repo with submodule. If not we assume that this is a standalone dsc module
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

      resource_tags = {}
      resource_tags = YAML::load_file("#{dsc_resources_file}") if File.exist? dsc_resources_file

      if !is_custom_resource
        puts "Getting latest release tags for DSC resources..."
        submodules.collect {|submodule| "#{dsc_resources_path_tmp}/#{submodule[:path]}"}.each do |submodule_path|
          dsc_resource_name = Pathname.new(submodule_path).basename
          FileUtils.cd(submodule_path) do
            # --date-order probably doesn't matter
            # Requires git version 2.2.0 or higher - https://github.com/git/git/commit/9271095cc5571e306d709ebf8eb7f0a388254d9d
            tags_raw = %x{ git log --tags --pretty=format:'%D' --simplify-by-decoration --date-order }

            # If the conversion of string to version starts to result in errors,
            # we should explore pushing this out out to a method where we can
            # clean up the tags that may have prerelease versions in them
            # similar to what was done in the Chocolatey module
            versions = tags_raw.scan(/(\S+)\-PSGallery/).map { | ver | Gem::Version.new(ver[0]) }
            if versions.empty?
              raise "#{dsc_resource_name} does not have any '*-PSGallery' tags. Appears it has not been released yet. Tags found #{tags_raw.to_s}"
            end

            latest_version = versions.max.to_s + "-PSGallery"
            tracked_version = resource_tags["#{dsc_resource_name}"]

            update_version = tracked_version.nil? ? true : update_versions
            if update_version
              puts "Using the latest/available reference of #{latest_version} for #{dsc_resource_name}."
              checkout_version = latest_version
            else
              puts "Using the specified reference of #{tracked_version} for #{dsc_resource_name}."
              checkout_version = tracked_version
            end

            # If the checkout_version is not a standard PSGallery tag, a git fetch
            # is required before a git checkout e.g. for commits or non-default branch names
            if !(checkout_version =~ /-PSGallery/)
              puts "#{checkout_version} is not a PSGallery tag. Fetching from git remote"
              sh "git fetch"
            end

            sh "git checkout #{checkout_version}"
            resource_tags["#{dsc_resource_name}"] = checkout_version.encode("UTF-8")
          end
        end
      end

      File.open("#{dsc_resources_file}", 'w+') {|f| f.write resource_tags.to_yaml }

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

    desc <<-eod
    Embed #{item_name}

Default values:
  dsc_resources_path: #{default_dsc_resources_path}"
eod

    task :embed, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
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

    desc <<-eod
    Cleanup #{item_name}

Default values:
  dsc_resources_path: #{default_dsc_resources_path}"
eod

    task :clean, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
      vendor_dsc_resources_path = "#{module_path}/lib/puppet_x/dsc_resources"
      puts "Cleaning #{item_name}"
      FileUtils.rm_rf "#{default_dsc_module_path}/import"
      FileUtils.rm_rf "#{vendor_dsc_resources_path}"
    end

  end

  namespace :types do

    item_name = 'DSC types and type specs'

    desc "Build #{item_name}"
    task :build, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
      m = Dsc::Manager.new
      m.dsc_modules_embedded = embedded_posh_modules
      wait_for_resources = Dir["#{module_path}/**/MSFT_WaitFor*"]
      fail "MSFT_WaitFor* resources found - aborting type building! Please remove the following MSFT_WaitFor* DSC Resources and run the build again.\n\n#{wait_for_resources}\n" if !wait_for_resources.empty?
      m.target_module_path = module_path
      msgs = m.build_dsc_types
      msgs.each{|m| puts "#{m}"}
    end

    desc "Document #{item_name}"
    task :document, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
      m = Dsc::Manager.new
      m.target_module_path = module_path
      m.document_types("#{module_path}/types.md", m.get_dsc_types)
    end

    desc "Cleanup #{item_name}"
    task :clean, [:module_path] do |t, args|
      module_path = args[:module_path] || default_dsc_module_path
      puts "Cleaning #{item_name}"
      m = Dsc::Manager.new
      m.target_module_path = module_path
      msgs = m.clean_dsc_types
      msgs.each{|m| puts "#{m}"}
      msgs = m.clean_dsc_type_specs
      msgs.each{|m| puts "#{m}"}
      FileUtils.rm_rf "#{default_dsc_module_path}/types.md"
    end

  end

  namespace :module do

    item_name = 'External DSC module'

    desc "Generate skeleton for #{item_name}"
    task :skeleton, [:dsc_module_path] do |t, args|
      dsc_module_path = args[:dsc_module_path] || default_dsc_module_path
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
