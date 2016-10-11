class UsersPublicReservationsController < ApplicationController

	def index

	end

	def new
		# @user_public_reservation = UsersPublicReservation.new
		@public_reservation = PublicReservation.find(params[:public_reservation_id])
		@package = @public_reservation.package
		@client_token = Braintree::ClientToken.generate

	end

	def create

		@public_reservation = PublicReservation.find(params[:checkout_form][:public_reservation_id])

		@package = @public_reservation.package

		amount = params[:checkout_form][:public_price]
		nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

		render action: :new and return unless nonce_from_the_client

		@result = Braintree::Transaction.sale(
				:amount => amount,
				:payment_method_nonce => nonce_from_the_client,
				:options => {
						:submit_for_settlement => true
					}
			)


		
		if @result.success? 
			transaction = @result.transaction

			@user_public_reservation = current_user.users_public_reservations.create(reservation_params)

			flash[:success] = 'Your payment has been successfully processed. Enjoy your trip!'

			redirect_to @user_public_reservation

		else 

			flash.now[:alert] = "Something went wrong while processing your transaction. Please try again!"
			render :new

		end

	end

	def show
		@user_public_reservation = UsersPublicReservation.find(params[:id])
		@public_reservation = @user_public_reservation.public_reservation
		@package = @public_reservation.package
	end

	private

	def reservation_params
		params.require(:checkout_form).permit(:public_reservation_id)
	end

end
