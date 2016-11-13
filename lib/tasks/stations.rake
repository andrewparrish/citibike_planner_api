namespace :stations do
  task :update => :environment do
    StationApiService.new.perform
  end
end
