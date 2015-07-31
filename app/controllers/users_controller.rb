class UsersController < ApplicationController
    skip_before_action :authenticate

  def sign_up
  end

  def sign_up!
    user = User.new(
      username: params[:username],
      password_digest: params[:password]
    )
    if params[:password_confirmation] != params[:password]
      message = "Your passwords don't match!"
      redirect_to action: :sign_up
    elsif user.save
      message = "Your account has been created! Now please sign in."
      redirect_to action: :sign_in
    else
      message = "Your account couldn't be created. Did you enter a unique username and password?"
      redirect_to action: :sign_up
    end
    flash[:notice] = message
  end

  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      message = "This user doesn't exist! Please sign up."
      redirect_to action: :sign_up
    elsif @user.password_digest != params[:password]
      message = "Your password's wrong!"
      redirect_to action: :sign_in
    else
      message = "Welcome, #{@user.username}!"
      session[:is_signed_in] = true
      session[:user] = User.find_by(username:params[:username])
      redirect_to posts_path
    end
    flash[:notice] = message
  end

  def sign_out
    flash[:notice] = "You're signed out!"
    reset_session
    redirect_to root_url
  end

end
