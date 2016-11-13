class StationApiService < CitibikeApiService
  def initialize
    super('/stations/stations.json')
  end

  private

  def process_data
    return false unless @data["stationBeanList"]
    @data["stationBeanList"].map do |station|
      Station.create_or_update_from_json(station)
    end
    true
  end
end