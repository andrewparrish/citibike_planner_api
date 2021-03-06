class StatsResponseProcessor
  def initialize(station_id, interval = 5, count = 12)
    @station_id = station_id
    @interval = interval
    @count = count
  end



  def perform
    {
        data: get_data,
        legend: get_legend
    }
  end

  private

  def minutes_back
    (@interval * @count).minutes
  end

  def time_back
    (Time.now - minutes_back).round(1.minute)
  end

  def histograms
    @histograms ||= get_histograms
  end

  def time_range_blocks
    slices = (time_range.each_slice(2).to_a + time_range.slice(1..-1).each_slice(2).to_a)
    slices.sort_by { |block| block.first }.reject { |arr| arr.count == 1}
  end

  def get_histograms
    time_range_blocks.map { |block| Histogram.between(@station_id, block.first..block.last).to_a.sort_by { |histo| histo.time } }
  end

  # Find the last histogram in the set (before all empty)
  def last_histogram
    last = 0
    histograms.each_with_index { |histos, index| last = index unless histos.empty? }
    last
  end

  def time_range
    @time_range ||= get_time_range
  end

  def get_time_range
    range = [time_back]
    (1..@count).each { |_index | range << (range.last + @interval.minutes) }
    range.uniq
  end

  def get_data
    {
        bikes: get_min_bikes.slice(0, last_histogram + 1),
        docks: get_min_docks.slice(0, last_histogram + 1)
    }
  end

  def get_min_docks
    histograms.map { |histos| histos.empty? ? "" : histos.map(&:available_docks).last }
  end

  def get_min_bikes
    histograms.map { |histos| histos.empty? ? "" : histos.map(&:available_bikes).last }
  end

  def get_legend
    time_range.slice(0, last_histogram + 1)
  end

  def station
    Station.find(@station_id)
  end
end