require 'rake'

namespace :seed_cool do
  SeedCool::ResourceManager.resources.each do |resource|
    desc "SeedCool - seed all #{resource}"
    task resource.to_sym => :environment do |t|
      Kernel.qualified_const_get("SeedCool::#{resource.to_s.singularize.camelize}Seeder").new.seed
    end
  end

  task :all => SeedCool::ResourceManager.resources + [:env_hook]

  task :env_hook => :environment do
    load "db/seed_cool/env/#{Rails.env}.rb"
  end
end

