namespace :db do
    desc "Checks to see if the database exists"
    task :exists do
        begin
            Rake::Task['environment'].invoke
            ActiveRecord::Base.connection
        rescue
            puts "Database doesn't exist or isn't on!"
            exit 1
        else
            puts "Database Exists. Continuing Forward"
            exit 0
        end
    end

    desc "Seeds a Specific File"
    namespace :seed do
        task :single => :environment do
            filename = Dir[File.join(Rails.root, 'db', 'seeds', "#{ENV['SEED']}.seeds.rb")][0]
            puts "Seeding #{filename}..."
            load(filename) if File.exist?(filename)
        end
    end
end
