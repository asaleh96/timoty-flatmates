class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new
    @request.user_id = params[:user_id]
    @request.household_id = current_user.household_id
    @request.save
    redirect_to user_path(User.find(params[:user_id]))
  end
end
