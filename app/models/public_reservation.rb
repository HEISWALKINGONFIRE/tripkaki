class PublicReservation < ActiveRecord::Base

	has_many :users, through: :users_public_reservations
	has_many :users_public_reservations

	belongs_to :package

  validates :start_date, :end_date, :public_price, presence: true
 


  def count_participants
  	self.users_public_reservations.count
  	
  end

  def status

  	max_participants = self.package.head
  	participants = self.count_participants

  	if self.start_date <= Date.today
  		return 'Closed'

  	elsif participants >= max_participants
  		return 'Full'

  	else 
  		return 'Open'

  	end

  end

end
