class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :move_to_index, except: [:index, :show]
  


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :family_name, :first_name_kana, :family_name_kana, :birthday])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
