require 'uri'
require 'net/http'
require 'json'

class CitibikeApiService
  BASE_URL = "https://feeds.citibikenyc.com"

  def initialize(endpoint)
    @data = nil
    @endpoint = endpoint
    @uri = URI(BASE_URL + endpoint)
  end

  def perform
    get_data
    process_data
  end

  private

  def process_data
    raise(NotImplementedError, "process_data not implemented for class: #{self.class}")
  end

  def get_data
    @data = JSON.parse(Net::HTTP.get(@uri))
  end
end