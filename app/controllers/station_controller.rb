class StationController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :get_station, except: [:index]
  def index
    @stations = Station.all
    render json: @stations.map(&:to_json)
  end

  def show
    render json: @station
  end

  def favorite
    current_user.favorite!(@station) ? (render status: 200) : (render status:  500)
  end

  def street_view
    render json: { street_view_url: @station.street_view_url(params[:width]) }
  end

  def last_weeks_stats
    render json: { data: Histogram.last_week(@station.id) }
  end

  private

  def get_station
    @station = Station.find(params[:station_id])
  end
end
