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
end
