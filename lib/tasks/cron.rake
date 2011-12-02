desc "This task is called by the Heroku cron add-on daily"
task :cron => :environment do
  Rake::Task['demo:reset'].invoke
end
