class MedicalResultPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def new?
    user_is_both?
  end

  def edit?
    user_is_both?
  end

  def show?
    return true
  end

  def create?
    user_is_both?
  end

  def update?
    user_is_both?
  end

  def destroy?
    user_is_both?
  end

  private

  def user_is_both?
    user.doctor || user.admin
  end
end
