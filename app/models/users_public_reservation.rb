class UsersPublicReservation < ActiveRecord::Base

	belongs_to :user
	belongs_to :public_reservation

 	validate :full_participants
 	validate :register?

 	def full_participants
  	if self.public_reservation.status == 'Full' || self.public_reservation.status == 'Closed'
  		errors.add(:user_id, "This tour is closed.")
  	end
  end

  def register?
  	invalid = UsersPublicReservation.find_by('user_id = ? AND public_reservation_id = ?', self.user_id, self.public_reservation.id)
  
  	if invalid
  		errors.add(:user_id, "You have applied for this tour")
  	end

  end

end
