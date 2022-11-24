class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  # Got rid of Edit & Update, handled by Devise

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :birthday_date)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
