module SeedCool

  class ERBContext

    def initialize(resource)
      extend SeedCool::SeedHelper
      extend Kernel.qualified_const_get("SeedCool::#{resource.to_s.singularize.camelize}Helper")
    end

    def eval(erb)
      erb.result(binding)
    end

  end

end