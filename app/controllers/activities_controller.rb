class ActivitiesController < ApplicationController
  before_action :set_household, only: %i[index new create edit update destroy]

  def new
    @activity = Activity.new
    @household = Household.find(params[:household_id])
  end

  def create
    params = activity_params
    @activity = Activity.new(params)
    @activity.household = @household
    @activity.user = current_user
    @activity.save
    redirect_to household_dashboard_path(current_user.household)
  end


  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    @activity.household = @household
    point_calculation
    redirect_to household_activities_path
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to household_activities_path
  end

  private

  def set_household
    @household = Household.find(params[:household_id])
  end

  def activity_params
    params.require(:activity).permit(:name, :points, :due_date, :description)
  end

  def point_calculation
    @household.users.each do |user|
      # user.earned_points = 0
      user.earned_points += Task.where(done: true, assignee: user).sum(:points) + Activity.where(done: true, user_id: user.id).sum(:points)
      user.save
    end
  end
end
