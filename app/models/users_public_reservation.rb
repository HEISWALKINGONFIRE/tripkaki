class UsersPublicReservation < ActiveRecord::Base

	belongs_to :user
	belongs_to :public_reservation

 	validate :full_participants

 	def full_participants
  	if self.public_reservation.status == 'Full' || self.public_reservation.status == 'Closed'
  		errors.add(:user_id, "This tour is closed.")
  	end
  end


end
