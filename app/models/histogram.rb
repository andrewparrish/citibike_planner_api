# == Schema Information
#
# Table name: histograms
#
#  id              :integer          not null, primary key
#  week_day        :integer          not null
#  month           :integer          not null
#  day_of_month    :integer          not null
#  year            :integer          not null
#  hour            :integer          not null
#  minute          :integer          not null
#  time        :datetime         not null
#  available_bikes :integer
#  available_docks :integer
#  station_id      :integer
#

class Histogram < ActiveRecord::Base
  belongs_to :station

  scope :last_week, ->(station_id) { where("time > ? AND station_id = ?", (Time.now - 1.week), station_id) }
end
