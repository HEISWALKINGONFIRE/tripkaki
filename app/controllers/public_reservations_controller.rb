class PublicReservationsController < ApplicationController
  
  before_action :find_package, only: [:new, :create, :show, :edit, :update]
  before_action :find_public_reservation, only: [:show, :edit, :update]
  before_action :authenticate_tour_guide!, only: [:new, :create, :edit, :update]

  def new
    @public_reservation = PublicReservation.new
  end

  def create
    @public_reservation = @package.public_reservations.new(reservation_params)

    if @public_reservation.save

      redirect_to @package
    else
      render 'new'
    end

  end

  def show
    @user = @package.user
  end

  def edit
  end

  def update
    
    if @public_reservation.update(reservation_params)
      redirect_to package_public_reservation_path(params[:package_id], @public_reservation.id)
    else
      render 'edit'
    end

  end

  private

  def find_package
    @package = Package.find(params[:package_id])
  end

  def find_public_reservation
    @public_reservation = PublicReservation.find(params[:id])
  end

  def reservation_params
    params.require(:public_reservation).permit(:public_price, :start_date, :end_date)
  end

  def authenticate_tour_guide!
    redirect_to root_path unless current_user.role == "tour_guide"
  end

end
