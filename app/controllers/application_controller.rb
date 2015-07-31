class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate


  def current_user
    return User.find(session[:user_id])
  end

  private
  def authenticate
    if !session[:is_signed_in]
      redirect_to "/sign_in"
    end
  end
end
