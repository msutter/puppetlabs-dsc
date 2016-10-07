module Dsc
  class Manager

    attr_accessor :module_path,
    :target_module_location,
    :dsc_modules_embedded,
    :dsc_modules_folder,
    :dsc_resources_file,
    :puppet_type_subpath,
    :puppet_type_spec_subpath

    def initialize
      @dsc_lib_path             = Pathname.new(__FILE__).dirname
      @tools_path               = @dsc_lib_path.parent
      @module_path              = @tools_path.parent

      @base_qualifiers_folder   = "#{@module_path}/build/qualifiers/base"

      @import_folder            = "#{@module_path}/import"
      @dsc_modules_folder       = "#{@import_folder}/dsc_resources"
      @dsc_resources_file       = "#{@module_path}/dsc_resource_release_tags.yml"
      @dmtf_mof_folder          = "#{@module_path}/build/vendor/dmtf_mof"
      @dsc_modules_embedded     = true

      @type_template_file       = "#{@dsc_lib_path}/templates/dsc_type.rb.erb"
      @type_spec_template_file  = "#{@dsc_lib_path}/templates/dsc_type_spec.rb.erb"

      @target_module_location   = @module_path
      @puppet_type_subpath      = "lib/puppet/type"
      @puppet_type_spec_subpath = "spec/unit/puppet/type"

      @json_content             = nil
      @resources_hash           = nil
      @resources                = nil
      @cim_classes_with_path    = nil

      @spec_test_values         = {
        'string'   => 'foo',
        'string[]' => ['foo','bar','spec'],
        'MSFT_Credential' => { 'user' => 'user', 'password' => 'password' },
        'MSFT_KeyValuePair' => { 'somekey' => 'somevalue' },
        'MSFT_KeyValuePair[]' => { 'somekey' => 'somevalue', 'somekey2' => 'somevalue2' },
        'bool'     => true,
        'boolean'  => true,
        'munged_bools' => ['true','false','True', 'False', :true, :false],
        'munged_ints' => ['16','-16','32', '-32'],
        'munged_uints' => ['16','32','64'],
        'int_not_bool_mungeable'  => -16,
        'uint_not_bool_mungeable' => 16,
        'datetime' => '20140711',
        'int8'     => -16,
        'int8[]'   => [-128, 0, 127],
        'int16'    => -16,
        'int16[]'  => [-16, 32, -64],
        'int32'    => -32,
        'int32[]'  => [-32, 64, -128],
        'int64'    => -64,
        'int64[]'  => [-64, 128, -256],
        'sint8'     => -128,
        'sint8[]'   => [-128, 0, 127],
        'sint16'    => -16,
        'sint16[]'  => [-16, 32, -64],
        'sint32'    => -32,
        'sint32[]'  => [-32, 64, -128],
        'sint64'    => -64,
        'sint64[]'  => [-64, 128, -256],
        'uint8'    => 1,
        'uint8[]'  => [0, 16, 255],
        'uint16'   => 16,
        'uint16[]' => [16, 32, 64],
        'uint32'   => 32,
        'uint32[]' => [32, 64, 128],
        'uint64'   => 64,
        'uint64[]' => [64, 128, 256],
        'real32'   => '32.000',
        'real64'   => '64.000',
      }

    end

    def ensure_versions(submodules, update_versions, release_tag_prefix, release_tag_suffix)
      dsc_resources_path_tmp = @dsc_modules_folder + "_tmp"
      resource_tags = {}
      resource_tags = YAML::load_file("#{@dsc_resources_file}") if File.exist? @dsc_resources_file
      submodules.collect {|submodule| "#{dsc_resources_path_tmp}/#{submodule[:path]}"}.each do |submodule_path|
        FileUtils.cd(submodule_path) do
          dsc_resource_name = %x{ git config --get remote.origin.url }.split('/').last.split('.').first.chomp
          # --date-order probably doesn't matter
          # Requires git version 2.2.0 or higher - https://github.com/git/git/commit/9271095cc5571e306d709ebf8eb7f0a388254d9d
          tags_raw = %x{ git log --tags --pretty=format:'%D' --simplify-by-decoration --date-order }
          tags = tags_raw.scan(/^tag: .*/)
          if !tags.empty?
            if release_tag_prefix || release_tag_suffix
              prefix_regex = release_tag_prefix ? Regexp.quote(release_tag_prefix) : ""
              suffix_regex = release_tag_suffix ? Regexp.quote(release_tag_suffix) : ""
              version_regex = Regexp.new "#{prefix_regex}(\\S+)#{suffix_regex}"
              versions = tags_raw.scan(version_regex).map { | ver | Gem::Version.new(ver[0]) }
              # If the conversion of string to version starts to result in errors,
              # we should explore pushing this out out to a method where we can
              # clean up the tags that may have prerelease versions in them
              # similar to what was done in the Chocolatey module
              if versions.empty?
                raise "#{dsc_resource_name} does not have any '#{prefix_regex}[*]#{release_tag_suffix}' tags. Appears it has not been released yet. Tags found #{tags_raw.to_s}"
              end
              latest_version = "#{release_tag_prefix}" + versions.max.to_s + "#{release_tag_suffix}"
            else
              # TODO
              latest_version = "#{release_tag_prefix}" + versions.max.to_s + "#{release_tag_suffix}"
            end
          else
            # Use last commit as ref
            last_commit = %x{ git log -n 1 --pretty=format:"%H" }
            latest_version = last_commit
          end

          tracked_version = resource_tags["#{dsc_resource_name}"]
          update_version = tracked_version.nil? ? true : update_versions

          if update_version
            puts "Using the latest/available reference of #{latest_version} for #{dsc_resource_name}."
            checkout_version = latest_version
          else
            puts "Using the specified reference of #{tracked_version} for #{dsc_resource_name}."
            checkout_version = tracked_version
            %x(git fetch)
          end

          %x(git checkout #{checkout_version})
          resource_tags["#{dsc_resource_name}"] = checkout_version.encode("UTF-8")
        end
      end
      File.open("#{@dsc_resources_file}", 'w+') {|f| f.write resource_tags.to_yaml }
    end

    def get_spec_test_value(type)
      # generate a hash here for any EmbeddedInstance type not seen yet
      if ! @spec_test_values[type]

        type_name = type.gsub(/\[\]$/, '') # strip [] off end of MOF type name
        values = cim_classes_with_path
          .select{ |c| c[:klass].name == type_name }
          .first[:klass]
          .features
          .map do |prop|
            # use first value in ValueMap if present
            if prop.qualifiers['Values']
              val = prop.qualifiers['Values'].value.first
            else
              val = get_spec_test_value(prop.type.to_s)
            end
            [prop.name, val]
          end

        @spec_test_values[type] = Hash[ values ]
      end

      @spec_test_values[type]
    end

    def dsc_results
      mof = Dsc::Mof.new(
        :import_folder          => @import_folder,
        :dmtf_mof_folder        => @dmtf_mof_folder,
        :base_qualifiers_folder => @base_qualifiers_folder,
        :dsc_modules_folder     => @dsc_modules_folder,
      )
      mof.dsc_results
    end

    def cim_classes_with_path
      unless @cim_classes_with_path
        cim_classes_array = []
        dsc_results.each do |mof_path, mof_res|
          mof_res.classes.each do |cim_class|
            cim_classes_array << { :klass => cim_class, :path => mof_path }
          end
        end
        @cim_classes_with_path = cim_classes_array
      end
      @cim_classes_with_path
    end

    def resources
      unless @resources
        dsc_resources = []
        cim_classes_with_path.select{|cc| cc[:klass].superclass == "OMI_BaseResource" }.each do |cim_class_with_path|
          dsc_resources << Dsc::Resource.new(cim_class_with_path[:klass], cim_class_with_path[:path], @dsc_modules_embedded)
        end
        @resources = dsc_resources
      end
      @resources
    end

    def embedded_resources
      resources.select{|r|r.has_embeddedinstances?}
    end

    def embedded_class_names
      class_names_array = []
      embedded_resources.each do |er|
        er.embedded_properties.each do |ep|
          class_names_array << ep.embeddedinstance_class_name
        end
      end
      class_names_array.uniq
    end

    def embedded_cim_classes
      cim_classes_with_path.select{|cc| embedded_class_names.include?(cc[:klass].name) }.collect{|cc| cc[:klass] }
    end

    def build_dsc_types
      type_pathes = []
      resources.each do |resource|
        type_template = File.open(@type_template_file, 'r').read
        type_erb = ERB.new(type_template, nil, '-')
        type_spec_template = File.open(@type_spec_template_file, 'r').read
        type_spec_erb = ERB.new(type_spec_template, nil, '-')
        if resource.friendlyname
          puppet_type_path = "#{@target_module_location}/#{@puppet_type_subpath}"
          FileUtils.mkdir_p(puppet_type_path) unless File.exists?(puppet_type_path)
          File.open("#{puppet_type_path}/dsc_#{resource.friendlyname.downcase}.rb", 'w+') do |file|
            file.write(type_erb.result(binding))
            pn = Pathname.new(file.path).expand_path.relative_path_from(@module_path)
            type_pathes << "Add type - #{pn.to_s}"
          end
          puppet_type_spec_path = "#{@target_module_location}/#{@puppet_type_spec_subpath}"
          FileUtils.mkdir_p(puppet_type_spec_path) unless File.exists?(puppet_type_spec_path)
          File.open("#{puppet_type_spec_path}/dsc_#{resource.friendlyname.downcase}_spec.rb", 'w+') do |file|
            file.write(type_spec_erb.result(binding))
            pn = Pathname.new(file.path).expand_path.relative_path_from(@module_path)
            type_pathes << "Add type spec - #{pn.to_s}"
          end
        else
          puts "#{resource.name} from #{resource.dsc_module} has invalid mof (no friendlyname defined)"
          puts "#{resource.name} will not be usable with puppet"
        end
      end
      type_pathes
    end

    def get_dsc_types
      dsc_types = []
      resources.each do |resource|
        dsc_types << "dsc_#{resource.friendlyname.downcase}"
      end
      dsc_types
    end

    def document_types(markdown_file_path, dsc_types)
      puts "Creating #{markdown_file_path}"
      File.open("#{markdown_file_path}", 'w+') do |file|
        file.write("## Resource Types included with DSC module\n")
        file.write("For any system this module is installed on, use\n`Puppet describe typename` for more information.\n\n")

        file.write("#### WMF Core Types\n\n")
        file.write("Puppet Type | DSC Resource\n")
        file.write("----------- | -----------------\n")
        resources.select { |t| t.instance_name.downcase.match(/dsc_[^x]/)}.each do |dsc_type|
          pth = File.dirname(dsc_type.relative_mof_path.gsub(/import\/dsc_resources/,"build/vendor/wmf_dsc_resources"))
          file.write("dsc_#{dsc_type.friendlyname.downcase} | [#{dsc_type.friendlyname}](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/#{pth}) | #{dsc_type.relative_mof_path}\n")
        end

        file.write("\n#### Community x Prefixed types\n\n")
        resources.select { |t| t.instance_name.downcase.match(/dsc_x/)}.group_by { |dt| dt.ps_module.name}.each do |dsc_type|
          file.write("##### #{dsc_type[0]}\n\n")
          file.write("Puppet Type | DSC Resource | Github Repo\n")
          file.write("----------- | ----------------- | -----\n")
          dsc_type[1].each do | sb |
            pth = File.dirname(sb.relative_mof_path.gsub(/import\/dsc_resources/,"lib/puppet_x/dsc_resources"))
            file.write("dsc_#{sb.friendlyname.downcase} | [#{sb.friendlyname}](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/#{pth}) | [repo](https://github.com/PowerShell/#{dsc_type[0]})\n")
          end
          file.write("\n")
        end
      end
    end

    def clean_dsc_types
      puppet_type_path = "#{@target_module_location}/#{@puppet_type_subpath}"
      clean_folder(["#{puppet_type_path}/dsc_*.rb"])
    end

    def clean_dsc_type_specs
      puppet_type_spec_path = "#{@target_module_location}/#{@puppet_type_spec_subpath}"
      clean_folder(["#{puppet_type_spec_path}/dsc_*_spec.rb"])
    end

    # Mof's
    def import_dmtf_mofs
      Dsc::Import.download(@dmtf_cim_mof_zip_url, @dmtf_cim_mof_zip_path)
      Dsc::Import.unzip(@dmtf_cim_mof_zip_path, @dmtf_mof_folder)
    end

    def clean_dmtf_mofs
      clean_folder([@dmtf_mof_folder])
    end

    def format_type_value(type_value)
      case
      when type_value.class.name == 'Symbol'
        ":#{type_value}"
      when type_value.class.name == 'String'
        "'#{type_value}'"
      when type_value.class.name == 'Numeric'
        "#{type_value}"
      else
        type_value
      end
    end

    def format_newvalues(values)
      output = []
      values.each do |v|
        if v.respond_to?('downcase')
          output << format_type_value(v)
          output << format_type_value(v.downcase)
        else
          output << format_type_value(v)
        end
      end
      output.join(', ')
    end

    private

    def clean_folder(folders)
      type_pathes = []
      folders.each do |folder|
        Dir.glob("#{folder}").each do |filepath|
          pn = Pathname.new(filepath).expand_path.relative_path_from(@module_path)
          type_pathes << "Remove - #{pn.to_s}"
          FileUtils.rm_rf filepath
        end
      end
      type_pathes
    end

  end
end
