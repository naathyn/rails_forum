class UsersController < ApplicationController
  before_filter :correct_user, only: [:edit, :update]

  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome, and enjoy your stay!"
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_username(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to :root, notice: "Profile updated successfully"
    else
      render :edit
    end
  end

private

  def correct_user
    @user = User.find_by_username(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
