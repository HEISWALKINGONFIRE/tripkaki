class UsersPublicReservationsController < ApplicationController

	def index

	end

	def new
		@user_public_reservation = UsersPublicReservation.new
		@public_reservation = PublicReservation.find(params[:public_reservation_id])
		@package = @public_reservation.package

	end

	def create
		@package = PublicReservation.find(params[:users_public_reservation][:public_reservation_id]).package
		@user_public_reservation = current_user.users_public_reservations.new(reservation_params)

		if @user_public_reservation.save

			redirect_to @user_public_reservation


		elsif @user_public_reservation.errors.any?

			flash[:error] = 'This tour is closed'
			redirect_to package_path(@package)

		else render 'new'
		
		end

	end

	def show
		@user_public_reservation = UsersPublicReservation.find(params[:id])
		@public_reservation = @user_public_reservation.public_reservation
		@package = @public_reservation.package
	end

	private

	def reservation_params
		params.require(:users_public_reservation).permit(:public_reservation_id)
	end

end
