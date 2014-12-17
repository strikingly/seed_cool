require 'rails/generators'

module SeedCool
  module Generators
    class AddGenerator < ::Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      argument :model_name, :type => :string

      def create_seeder
        model = model_name.gsub(/\:\:/,'')
        models = model.underscore.pluralize
        seeder_file = "lib/seed_cool/seeders/#{model.underscore}_seeder.rb"
        copy_file "seeder.rb", seeder_file
        gsub_file seeder_file, /Model/, model
        gsub_file seeder_file, /models/, models
      end

      def create_helper
        model = model_name.gsub(/\:\:/,'')
        models = model.underscore.pluralize
        helper_file = "lib/seed_cool/helpers/#{model.underscore}_helper.rb"
        copy_file "helper.rb", helper_file
        gsub_file helper_file, /Model/, model
        gsub_file helper_file, /models/, models
      end

      def create_seed_file
        model = model_name.gsub(/\:\:/,'')
        models = model.underscore.pluralize
        seed_file = "db/seed_cool/#{models}.yml"
        copy_file "models.yml", seed_file
        gsub_file seed_file, /models/, models
      end

    end
  end
end
