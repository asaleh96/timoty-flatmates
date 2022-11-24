class HouseholdsController < ApplicationController

  def index
    @households = Household.all
  end

  def show
    @household = Household.find(params[:id])
  end

  def new
    @household = Household.new
  end

  def create
    params = household_params
    params[:captain_id] = current_user.id
    @household = Household.new(params)
    @household.save!
    if @household.save
      current_user.update(household_id: @household.id)
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @household = Household.find(params[:id])
  end

  def update
    @household = Household.find(params[:id])
    @household.update(household_params)
    redirect_to household_path(@household)
  end

  def destroy
    @household = Household.find(params[:id])
    @household.destroy
    redirect_to households_path
  end

  def users
    @users = User.all
  end

  def dashboard
    @household = Household.find(params[:id])
  end


  private

  def household_params
    params.require(:household).permit(:name, :captain_id)
  end


end
