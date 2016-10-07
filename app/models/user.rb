class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :packages
  has_many :private_reservations
  has_many :public_reservations, through: :users_public_reservations

  validates_presence_of :first_name, :last_name, :username

  enum role: {
  	user: 0,
  	tour_guide: 1
  }
end
