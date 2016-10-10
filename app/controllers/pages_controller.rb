class PagesController < ApplicationController
	#before_action :authenticate_user!

	def index
		@filterrific = initialize_filterrific(
        Package,
        params[:filterrific],
      ) or return
      @packages = @filterrific.find.page(params[:page])

      redirect_to packages_path
	end
end
