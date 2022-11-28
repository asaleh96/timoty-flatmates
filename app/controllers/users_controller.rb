class UsersController < ApplicationController

 # def index
  #  @users = User.all
   # @request = Request.new
  # end

  def index
    if params[:query].present?
      @users = User.where("username ILIKE ?", "%#{params[:query]}%")
    else
      @users = User.all
    end
    @request = Request.new
  end

  def show
    @user = User.find(params[:id])
    # authorize @user
  end

  # Got rid of Edit & Update, handled by Devise

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :birthday_date, :photo, :status, :earned_points)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
