class HouseholdPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # be all members who can see households
      # scope.where(captain: user)
      scope.all
    end
  end

    def create?
      true
    end

    def new?
      true
    end

    def show?
      true
    end

    def update?
      # record == household
      record.captain == user
    end

    def edit?
      update?
    end

    def destroy?
      record.captain == user
    end


  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
    raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

  private

  attr_reader :user, :scope
end


end
