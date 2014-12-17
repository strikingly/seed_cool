require 'seed_cool/resource_manager'

require 'seed_cool/erb_context'

load 'tasks/seed_cool.rake'

module SeedCool

  def init
    SeedCool::ResourceManager.seeders.each {|seeder| require "seed_cool/seeders/#{seeder}"}
    SeedCool::ResourceManager.helpers.each {|helper| require "seed_cool/helpers/#{helper}"}
  end

  module_function :init

end