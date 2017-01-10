class User < ActiveRecord::Base
  has_many :stations
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  def favorite!(station)
    stations << station
    save!
  end
end
