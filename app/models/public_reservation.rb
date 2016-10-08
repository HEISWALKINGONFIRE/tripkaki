class PublicReservation < ActiveRecord::Base

	has_many :users, through: :users_public_reservations

	belongs_to :package

  validates :start_date, :end_date, :public_price, presence: true


end
