class GenerateHistogramService
  @queue = :stations_queue

  def self.perform(station_hash, time)
    Histogram.find_or_create_by!(histogram_data(station_hash, time.beginning_of_minute))
  end

  private

  def histogram_data(station_hash, time)
    {
        station_id: station_hash[:id],
        week_day: time.wday,
        month: time.month,
        day_of_month: time.day,
        year: time.year,
        hour: time.hour,
        minute: time.minute,
        time: time,
        available_bikes: station_hash[:available_bikes],
        available_docks: station_hash[:available_docks]
    }
  end
end