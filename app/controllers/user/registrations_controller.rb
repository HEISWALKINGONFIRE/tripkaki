class User::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

prepend_before_action :set_minimum_password_length, only: [:new, :edit, :choose]
# before_action :configure_permitted_parameters, if: :devise_controller?
  # GET /resource/sign_up
  def new
    render 'users/registrations/choose'
  end

  def choose
    # byebug
    @role = params[:role]
    build_resource({})
    respond_to do |format|
      format.js {}
    end
  end

  # POST /resource
  def create
    
    build_resource(sign_up_params)
    resource.role = params[:user][:role].to_i if validates_role(params[:user][:role])
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  private

  def validates_role(role)
    return true unless @role == "0" || @role == "1"
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :profile_picture, :password, :password_confirmation, :email])
  # end

  def sign_up_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :profile_picture, :password, :password_confirmation)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :first_name, :last_name, :profile_picture, :password, :password_confirmation, :current_password])
  # end
 

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
