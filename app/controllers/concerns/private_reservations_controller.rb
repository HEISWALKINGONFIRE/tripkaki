class PrivateReservationsController < ApplicationController
	# before_action :authenticate_user!

	def new
		@private_reservation = PrivateReservation.new
	end

	def create
		@private_reservation = PrivateReservation.new(private_reservation_params)

		if @private_reservation.save
			
		else

		end
	end

	private
		def private_reservation_params
			params.require(:private_reservation).permit(:package_id, :user_id, :head_count, :start_date, :end_date)
		end

end