class ActivitiesController < ApplicationController
  before_action :set_household, only: %i[index new create edit update destroy]

  def new
    @household = Household.find(params[:household_id])
    @activity = Activity.new
  end

  def create
    @activity = Activiy.new(activity_params)
    @activity.household = @household
    @activity.save
    redirect_to household_path(@household)
  end

  private

  def set_household
    @household = Household.find(params[:household_id])
  end

  def review_params
    params.require(:activity).permit(:content)
  end
end
