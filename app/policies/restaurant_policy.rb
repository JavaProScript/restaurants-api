class RestaurantPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == current_user
  end

  def destroy?
    record.user == current_user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
