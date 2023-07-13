class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @user = User.find(params[:id])
  end


  def after_sign_in_path_for(resource)
    flash[:notice] = 'Welcome! You have signed up successfully.'
    users_path
    user = User.find(params[:id])
  end


  def after_sign_out_path_for(resource)
    flash[:notice] = 'Signed out successfully.'
    root_path
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])

  end

end
