class GenerateHistogramService
  @queue = :stations_queue

  def self.perform(station_id, bikes, docks, time)
    Histogram.find_or_create_by!(histogram_data(station_id, bikes, docks, DateTime.parse(time).beginning_of_minute))
  end

  def self.histogram_data(station_id, available_bikes, available_docks, time)
    {
        station_id: station_id,
        week_day: time.wday,
        month: time.month,
        day_of_month: time.day,
        year: time.year,
        hour: time.hour,
        minute: time.minute,
        time: time,
        available_bikes: available_bikes,
        available_docks: available_docks
    }
  end
end