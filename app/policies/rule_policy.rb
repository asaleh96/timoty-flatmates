class RulePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
    scope.all
    end

    def new?
      true
    end
  end
end
