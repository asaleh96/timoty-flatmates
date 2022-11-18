class RulesController < ApplicationController

  def index
      @rules = Rule.all
  end

  def new
    @rule = Rule.new
  end

  def create
    params = rules_params
    @rule = Rule.new(params)
    @rule.save!
    redirect_to rules_path
  end

  def edit
    @rule = Rule.find(params[:id])
  end

  def update
    @rule = Rule.find(params[:id])
    @rule.update(rule_params)
    redirect_to rules_path
  end

  def destroy
    @rule = Rule.find(params[:id])
    @rule.destroy
    redirect_to rules_path, status: :see_other
  end

  private

  def rules_params
    params.require(:rule).permit(:name)
  end

  def set_rule
    @rule = Rule.find(params[:id])
  end

end
