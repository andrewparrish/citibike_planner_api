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
    time_range_blocks.map { |block| Histogram.between(@station_id, block.first..block.last).to_a }
  end

  def time_range
    @time_range ||= get_time_range
  end

  def get_time_range
    range = [time_back]
    @count.times.to_a.slice(1..-1).each do |index|
      range << range.last + (index * @interval).minutes
    end
    range
  end

  def get_data
    {
        bikes: get_min_bikes,
        docks: get_min_docks
    }
  end

  def get_min_docks
    # histograms.reject(&:empty?).map { |histos| histos.map(&:available_docks).min }
    histograms.map do |histos|
      histos.empty? ? "" : histos.map(&:available_docks).min
    end
  end

  def get_min_bikes
    # histograms.reject(&:empty?).map { |histos| histos.map(&:available_bikes).min }
    histograms.map do |histos|
      histos.empty? ? "" : histos.map(&:available_bikes).min
    end
  end

  def get_legend
    # time_range.slice(1..-2).each_with_index.reject { |_time, index| histograms[index].empty? }.map { |time, _index| time }
    time_range.slice(1..-2).each_with_index.map do |time, index|
      time
    end
  end

  def station
    Station.find(@station_id)
  end
end