class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :packages
  has_many :private_reservations
  has_many :public_reservations, through: :users_public_reservations
  has_many :users_public_reservations
  
  validates_presence_of :first_name, :last_name, :username

  mount_uploaders :profile_picture, ProfilePictureUploader

  enum role: {
  	user: 0,
  	tour_guide: 1
  }
  before_save :assign_role_if_not_exists

  private

  def assign_role_if_not_exists
  	self.role ||= 0
  end
end
