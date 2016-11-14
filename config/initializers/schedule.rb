require Rails.root.join('lib', 'scheduler')

scheduler = Scheduler.get_scheduler
Scheduler.add_event('1m', UpdateStations)
