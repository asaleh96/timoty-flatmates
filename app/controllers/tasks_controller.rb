class TasksController < ApplicationController
  before_action :set_household, only: %i[new create update edit]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.household_id = @household.id
    @task.creator = current_user
    @task.assignee = nil
    @task.save!

    redirect_to household_tasks_path(@household)
  end

   # PATCH /tasks/:id

   def edit
    @task = Task.find(params[:id])
   end

   def update
    @task = Task.find(params[:id])
    @task.household_id = @household.id
    if @task.update(task_params)
     redirect_to household_tasks_path, status: :see_other, notice: "Successfully updated task"
   end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to household_tasks_path
  end


  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :points, :done)
  end

  def set_household
    @household = Household.find(params[:household_id])
  end
end
