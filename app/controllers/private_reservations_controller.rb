class PrivateReservationsController < ApplicationController
	def new
		@private_reservation = PrivateReservation.new
	end

	def create
		package = Package.find(params[:package_id])
		@private_reservation = package.private_reservations.new(private_reservation_params)
		@private_reservation.user_id = current_user.id

		if @private_reservation.save
			redirect_to package_private_reservation_path(@private_reservation.package, @private_reservation)
		else
			@private_reservation = PrivateReservation.new
			render :new
		end
	end

	def show
		@private_reservation = PrivateReservation.find(params[:id])
	end


	private
		def private_reservation_params
			params.require(:private_reservation).permit(:head_count, :start_date, :end_date)
		end
end
