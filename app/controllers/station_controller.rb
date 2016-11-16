class StationController < ApplicationController
  def index
    @stations = Station.all
    render json: @stations.map(&:to_json)
  end

  def show
    @station = Station.find(params[:id])
    render json: @station
  end
end
