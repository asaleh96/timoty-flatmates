class RulesController < ApplicationController
  before_action :set_household, only: %i[index new create edit update]

  def index
    @rules = Rule.where(household_id: @household.id)
  end

  def new
    @rule = Rule.new
  end

  def create
    params = rules_params
    @rule = Rule.new(params)
    @rule.household = @household
    @rule.save!
    redirect_to household_rules_path
  end

  def edit
    @rule = Rule.find(params[:id])
  end

  def update
    @rule = Rule.find(params[:id])
    @rule.update(rules_params)
    @rule.household = @household
    redirect_to household_rules_path
  end

  def destroy
    @rule = Rule.find(params[:id])
    @rule.destroy
    redirect_to household_rules_path
  end

  private

  def rules_params
    params.require(:rule).permit(:name, :household_id)
  end

  def set_rule
    @rule = Rule.find(params[:id])
  end

  def set_household
    @household = Household.find(params[:household_id])
  end
end
