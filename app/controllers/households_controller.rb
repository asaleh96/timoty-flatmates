class HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :edit, :update, :destroy]

  def index
    @households = Household.all
  end

  def show
    authorize @household
  end

  def new
    @household = Household.new
    authorize @household
  end

  def create
    params = household_params
    params[:captain_id] = current_user.id
    current_user.is_captain = true
    current_user.save!
    @household = Household.new(params)
    @household.save!
    if @household.save
      redirect_to users_path
    else
      render :new
    end
    authorize @household
  end

  def edit
    @household = Household.find(params[:id])
  end

  def update
    @household.update(household_params)
    redirect_to household_path(@household)
  end

  def destroy
    @household.destroy
    redirect_to households_path
  end

  def users
    @users = User.all
  end

  private

  def household_params
    params.require(:household).permit(:name, :captain_id)
  end

  def set_household
    @household = Household.find(params[:id])
    authorize @household
  end
end
