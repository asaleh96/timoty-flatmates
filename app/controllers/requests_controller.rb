class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new
    @request.user_id = params[:user_id]
    @request.household_id = current_user.household_id
    @request.save
    #redirect_to user_path(User.find(params[:user_id]))

  end

  def index
    @user = User.find(params[:user_id])
    @requests = Request.where(user_id: params[:user_id], accepted: false || nil)
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    @request.update(request_params)
    @user = User.find(@request.user_id)
    @user.update(household_id: @request.household_id)
    # redirect_to user_path(User.find(params[:user_id]))
  end

  def request_params
    params.require(:request).permit(:accepted)
  end
end
