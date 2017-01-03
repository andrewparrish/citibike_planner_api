require Rails.root.join('lib', 'scheduler')

scheduler = Scheduler.get_scheduler
unless Rails.env == "production"
  Scheduler.add_event('1m', UpdateStations)
end
