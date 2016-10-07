class Package < ActiveRecord::Base<<<<<<< HEAD

	belongs_to :user
	has_many :private_reservations
	has_many :public_reservations

end
