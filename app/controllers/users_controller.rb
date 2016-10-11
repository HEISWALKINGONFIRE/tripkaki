class UsersController < ApplicationController
	# before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@packages = @user.packages if @user.role == "tour_guide"
	end
end
