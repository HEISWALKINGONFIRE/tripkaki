class PublicReservation < ActiveRecord::Base

	has_many :users, through: :users_public_reservations

	belongs_to :package

end
