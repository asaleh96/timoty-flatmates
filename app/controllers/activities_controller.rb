class ActivitiesController < ApplicationController
  before_action :set_household, only: %i[index new create edit update destroy]

  def new
    @household = Household.find(params[:household_id])
    @activity = Activity.new
  end

  def create
    @activity = Activiy.new(activity_params)
    @activity.household_id = @household.id
    @activity.creator = current_user
    @activity.save
    redirect_to household_activities_path(@household)
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    @activity.household = @household
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
    params.require(:activity).permit(:content)
  end
end
