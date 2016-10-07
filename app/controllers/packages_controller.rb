class PackagesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @packages = @user.packages
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

  def edit
    @package = Package.find(params[:id])
  end

  def show
    @package = Package.find(params[:id])
    @user = @package.user

    @country = Carmen::Country.coded(@package.country)

    @subregions = @country.subregions
    @state = @subregions.coded(@package.state)
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

end
