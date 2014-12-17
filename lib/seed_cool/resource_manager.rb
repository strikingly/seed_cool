module SeedCool

  class ResourceManager

    RESOURCE_ROOT_DIR = "db/seed_cool"

    def self.load(resource)
      if resources.include? resource.to_sym
        resource_path = "#{RESOURCE_ROOT_DIR}/#{resource}.yml"
        resource_array = YAML::load(ERBContext.new(resource).eval(ERB.new(IO.read(resource_path)))) if File.file?(resource_path)
        resource_array ||= []
        env_resource_path = "#{RESOURCE_ROOT_DIR}/env/#{Rails.env}/#{resource}.yml"
        env_resource_array = YAML::load(ERBContext.new(resource).eval(ERB.new(IO.read(env_resource_path)))) if File.file?(env_resource_path)
        env_resource_array ||= []
        resource_array + env_resource_array
      else
        []
      end
    end

    def self.resources
      Dir.glob("#{RESOURCE_ROOT_DIR}/*.yml").map {|f| File.basename(f).gsub('.yml', '').to_sym}
    end

    def self.seeders
      Dir.glob("lib/seed_cool/seeders/*.rb").map {|f| File.basename(f).gsub('.rb', '')}
    end

    def self.helpers
      Dir.glob("lib/seed_cool/helpers/*.rb").map {|f| File.basename(f).gsub('.rb', '')}
    end

  end

end
