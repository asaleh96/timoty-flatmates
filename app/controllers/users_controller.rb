class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
  end

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
    count_all_tasks
    count_tasks_to_be_done
  end

  def count_all_tasks
    user = current_user
    @alltasks = Task.where(assignee: user).count
    @alltasks = 0 if @alltasks.nil?
  end

  def count_tasks_to_be_done
    user = current_user
    @taskstodo = Task.where(assignee: user, done: false).count
    @taskstodo = 0 if @taskstodo.nil?
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
