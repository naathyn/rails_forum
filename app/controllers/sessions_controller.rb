class SessionsController < ApplicationController

  def new
    if signed_in?
      redirect_to(user_url(current_user), notice: "You are already signed in")
    else
      @title = "Sign in"
    end
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Glad to see you're back, #{user.username}!"
      redirect_back_or :root
    else
      flash.now[:error] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to(:root, notice: "You have been signed out.  See you soon!")
  end
end
