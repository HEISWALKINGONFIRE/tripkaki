class PrivateReservationsController < ApplicationController
	def new
		@private_reservation = PrivateReservation.new
	end

	def create
		package = Package.find(params[:package_id])
		@private_reservation = package.private_reservations.new(private_reservation_params)
		@private_reservation.user_id = current_user.id

		if @private_reservation.save
			redirect_to @private_reservation
		else
			@private_reservation = PrivateReservation.new
			render :new
		end
	end

	def show
		@private_reservation = PrivateReservation.find(params[:id])
	end

	def edit
		@private_reservation = PrivateReservation.find(params[:id])
	end

	def destroy
		PrivateReservation.destroy(params[:id])
		redirect_to "/users/#{current_user.id}"
	end

	private
		def private_reservation_params
			params.require(:private_reservation).permit(:head_count, :start_date, :end_date)
		end
end
