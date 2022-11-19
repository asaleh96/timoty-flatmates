class TasksController < ApplicationController
  before_action :set_household, only: %i[new create]
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

  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :points)
  end

  def set_household
    @household = Household.find(params[:household_id])
  end
end
