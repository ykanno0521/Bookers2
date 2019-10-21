class ApplicationController < ActionController::Base
  protect_from_forgery except: :search # searchアクションを除外
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!


	def after_sign_in_path_for(resources)
		user_path(current_user)
	end

	def after_sign_up_path_for(resources)
		user_path(current_user)
	end

  def after_sign_out_path_for(resources)
    root_path # ←redirect先にしたいpathを自分で書く
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
