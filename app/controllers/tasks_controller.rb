class TasksController < ApplicationController
  #PUNDIT NOTES
  # index: Everyone (in the household?)
  # new+create: captain
  # edit: creator
  # update: task assignee or creator
  # destroy: creator?

  before_action :set_household, only: %i[new create update edit]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    # authorize @task
  end

  def create
    @task = Task.new(task_params)
    @task.household_id = @household.id
    @task.creator = current_user
    @task.assignee = current_user
    # @task.assignee = current_user
    # authorize @task
    @task.save!

    redirect_to household_tasks_path(@household)
  end

  # PATCH /tasks/:id

  def edit
    @task = Task.find(params[:id])
    # authorize @task
  end

  def update
    @task = Task.find(params[:id])
    @task.household_id = @household.id
    # authorize @task
    if @task.update(task_params)
      redirect_to household_tasks_path, status: :see_other, notice: "Successfully updated task"
      point_calculation
    end
  end

  def destroy

    @task = Task.find(params[:id])
    # authorize @task
    @task.destroy
    redirect_to household_tasks_path
  end


  private

  def point_calculation
    @household.users.each do |user|
      user.earned_points = 0
      user.earned_points += Task.where(done: true, assignee: user).sum(:points)
      user.save
    end
  end

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :points, :done)
  end

  def set_household
    @household = Household.find(params[:household_id])
  end
end
