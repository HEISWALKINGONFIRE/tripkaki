class PackagesController < ApplicationController
  before_action :authenticate_tour_guide!, only: [:new, :create, :edit, :delete, :update]

  def index
    @filterrific = initialize_filterrific(
        Package,
        params[:filterrific],
        select_options: {
          sorted_by: Package.options_for_sorted_by,
        }
      ) or return
      @packages = @filterrific.find.page(params[:page])

      respond_to do |format|
        format.html
        format.js
      end
  end

  def new
    @package = Package.new
  end

  def create
  
    @package = current_user.packages.new(package_params)

    if @package.save
      # flash[:notice] = "You have successfully created a new package!"
      redirect_to @package
    else
      render 'new'
      # flash[:error] = 'Error, package has not been created.'
    end

  end

  def show
    @package = Package.find(params[:id])
    @user = @package.user
    @public_reservations = @package.public_reservations.order(:start_date)

  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])

    if @package.update(package_params)
      redirect_to @package
    else
      render 'edit'
    end

  end

  def destroy
    @package = Package.find(params[:id])
    
    if @package.destroy
      redirect_to user_packages_path(current_user.id)
    else
      render 'show'
    end
  end

  def subregion_options
    render partial: 'subregion_select'
  end

  private

  def package_params
    params.require(:package).permit(:title, :destination, :state, :country, :day, :description, :accommodation, :transportation, :meal, :head, :public_price, :private_price, {images: []})
  end

  def authenticate_tour_guide!
    redirect_to root_path unless current_user.role == "tour_guide"
  end

end
