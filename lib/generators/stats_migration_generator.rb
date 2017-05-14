=begin
http://www.ostinelli.net/setting-multiple-databases-rails-definitive-guide/
  Add a custom generator

Unfortunately, we cannot simply use Rails’ generator ActiveRecord::Generators::MigrationGenerator because it hardcodes the parent directory of the migration (notice the path hardcoded to the directory db/migrate in line 4 here below):


  def create_migration_file
      set_local_assigns!
        validate_file_name!
	  migration_template @migration_template, "db/migrate/#{file_name}.rb"
end
1
2
3
4
5
def create_migration_file
    set_local_assigns!
      validate_file_name!
        migration_template @migration_template, "db/migrate/#{file_name}.rb"
end
Therefore, we need to have a custom generator to create migrations for the Stats database. However, we can still inherit from it and monkey patch this specific function. Create the following generator in lib/generators/stats_migration_generator.rb:

=end

require 'rails/generators/active_record/migration/migration_generator'

class StatsMigrationGenerator < ActiveRecord::Generators::MigrationGenerator
  source_root File.join(File.dirname(ActiveRecord::Generators::MigrationGenerator.instance_method(:create_migration_file).source_location.first), "templates")

  def create_migration_file
    set_local_assigns!
    validate_file_name!
    migration_template @migration_template, "db_stats/migrate/#{file_name}.rb"
  end
end

=begin

With all of this in place, we can now generate migrations for the Stats database:


  $ rails g stats_migration create_clicks
      create  db_stats/migrate/20151201191642_create_clicks.rb
      1
      2
      $ rails g stats_migration create_clicks
            create  db_stats/migrate/20151201191642_create_clicks.rb
	    You’ll notice that the migration file gets created in the Stats database migrate directory db_stats/migrate. You can edit this file and then run your migrations with the Rake task that we’ve set up in the previous steps, just as you normally would do with your primary database:


	      $ rake stats:db:migrate
	    1
	    $ rake stats:db:migrate

=end	    
