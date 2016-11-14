class UpdateStations
  @queue = :stations_queue

  def self.perform
    StationApiService.new.perform
  end
end