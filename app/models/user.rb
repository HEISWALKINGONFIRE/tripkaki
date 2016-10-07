class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :username
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
