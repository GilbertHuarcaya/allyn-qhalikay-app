class RecordPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def medical_histories?
    return true
  end

  def show?
    return true
  end

  def create?
    user.doctor
  end

  def patients_records?
    user_is_both?
  end

  def edit?
    user_is_both?
  end

  def update?
    user_is_both?
  end

  def destroy?
    user.admin
  end

  private

  def user_is_both?
    user.doctor || user.admin
  end
end
