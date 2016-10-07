class UserPublicReservation < ActiveRecord::Base

	belongs_to :user
	belongs_to :public_reservation

end
