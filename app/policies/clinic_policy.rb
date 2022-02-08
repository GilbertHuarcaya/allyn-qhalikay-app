class ClinicPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def create?
    user.admin
  end

  def update?
    user.admin
  end

  def destroy?
    user.admin
  end

  private

  def user_is_both?
    user.doctor || user.admin
  end
end
