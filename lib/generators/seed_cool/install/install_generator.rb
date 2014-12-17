module SeedCool
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      def create_initializer
        copy_file "initializer.rb", "config/initializers/seed_cool.rb"
      end

      def create_db_directories
        [:development, :test, :staging, :production].each do |env|
          directory 'empty_directory', "db/seed_cool/env/#{env}"
          env_file = "db/seed_cool/env/#{env}.rb"
          copy_file "environment.rb", env_file
          gsub_file env_file, /\[ENV\]/, env.to_s
        end
      end

      def create_lib_directories
        directory 'empty_directory', "lib/seed_cool/seeders/"
        helper_file = "lib/seed_cool/helpers/seed_helper.rb"
        copy_file "helper.rb", helper_file
      end

    end
  end
end
