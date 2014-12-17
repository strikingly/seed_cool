# SeedCool - a robust yet flexible seeding solution

SeedCool is Strikingly's new seeding solution, which provides a set of rails generators and rake tasks to make it much easier to manage seeding data. With SeedCool, you can select what data you want to seed, and even define your very own complicated seeding logic. In short, it makes seeding a cool thing, not a pain in the ass.

## Get started

Install SeedCool

```
rails g seed_cool:install
```

Add SeedCool support for a model

```
rails g seed_cool:add Model
```

Example:

```
rails g seed_cool:add User
```

will generate the following files:

```
lib/seed_cool/seeders/user_seeder.rb
lib/seed_cool/helpers/user_helper.rb
db/seed_cool/users.yml
```

After you implement the seeding logic in user_seeder.rb, you can use the following rake task to seed all users:

```
rake seed_cool:users
```

That's it!

## Advanced usage

### ERB support

SeedCool reads data from standard YAML files. Besides that SeedCool embeds erb evaluation engine that makes it possible to embed Ruby code in YAML files.

For example in users.yml you can do this:

```
<% my_name = 'Alice' %>
---
-
  name: <%= my_name %>
```

### Helpers

However, having a lot of Ruby code in YAML data files may look unclean. Instead of putting all Ruby code in YAML data files, you can write helper methods in helpers, and the erb evaluation engine will automatically load these helper methods.

In particular, each model has its own helper, where the methods cannot be accessed by data files of other models. All models share methods in ```lib/seed_cool/seeders/seed_helper.rb```.

### Models

From SeedCool point of view, model is a general concept that represents your business data. A model doesn't have to be an ActiveRecord model, and the data may not be seeded to a relational database -- it can be a NoSQL database, or even a 3rd party service.

### Environment specific data

SeedCool is very useful if you have a lot of data driven logic. You can use SeedCool to quickly setup same data in different environments.

However sometimes you don't want all environments to have the same data. SeedCool handles that by loading environment specific data files.

Take the model User for example. ```db/seed_cool/users.yml``` will be seeded in all environments, while ```db/seed_cool/env/development/users.yml``` allows you to only seed some data in development environment.
