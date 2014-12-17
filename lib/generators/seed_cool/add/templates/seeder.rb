module SeedCool

  class ModelSeeder

    def seed
      ResourceManager.load(:models).each do |entry|
        # Put your seeding implementation here
      end
    end

  end

end