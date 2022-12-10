class HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :edit, :update, :destroy]

  # As a user, I can only see my Household
  # As a captain, I can create an Household (OK) > View Needed
  # As a captain, I can update an Household
  # As a captain, I can delete an Household

  # Not sure about this Index method ?

  # Make sure the HOUSEHOLD/INDEX is not accessible
  def index
   @households = Household.all # = policy_scope(Household)
  end

  def show
    # authorize @household
    @household = Household.find(params[:id])

  end


  def new
    @household = Household.new
   # authorize @household
  end

  def create
    @household = Household.new(household_params)
    @household.captain = current_user
    current_user.is_captain = true
    current_user.save!
    # authorize @household

    if @household.save
      current_user.update(household_id: @household.id)
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    #vauthorize @household
  end

  def update
   # authorize @household
    @household.update(household_params)
    redirect_to household_path(@household)
  end

  def destroy
   # authorize @household
    @household.destroy
    redirect_to households_path
  end

  def users
    @users = User.all
  end

  def dashboard
    @household = Household.find(params[:household_id])
    @users = User.where(household_id: @household.id)
    @tasks = Task.where(household_id: @household.id)
    # @tasks.each do |task|
    # if current_user == task.assignee && task.done?
    #  current_user.earned_points += task.points
    # end
    # end
end

  def confirmation
    @household = Household.find(params[:household_id])
  end

  def configuration
    @household = Household.find(params[:household_id])
  end




  private

  def household_params
    params.require(:household).permit(:name, :captain_id)
  end

  def set_household
    @household = Household.find(params[:id])
   # authorize @household
  end
end
