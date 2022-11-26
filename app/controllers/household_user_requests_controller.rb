class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new
    @request.user = params[:user_id]
    @request.household = request.user.household
    @request.save
    redirect_to household_path(@request.household)
  end
end
