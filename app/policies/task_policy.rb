class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

end
