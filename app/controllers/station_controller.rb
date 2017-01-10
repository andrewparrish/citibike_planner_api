class StationController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @stations = Station.all
    render json: @stations.map(&:to_json)
  end

  def show
    @station = Station.find(params[:id])
    render json: @station
  end

  def favorite
    @station = Station.find(params[:station_id])
    current_user.favorite!(@station) ? (render status: 200) : (render status:  500)
  end
end
