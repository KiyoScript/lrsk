class Dashboard::PatientsPolicy < ApplicationPolicy
  def index?
    user.administrator? || user.staff?
  end

  def new?
    user.administrator? || user.staff?
  end

  def create?
    user.administrator? || user.staff?
  end

  def show?
    user.administrator? || user.staff?
  end

  def update?
    user.administrator? || user.staff?
  end

  def edit?
    user.administrator? || user.staff?
  end

  def destroy?
    user.administrator? || user.staff?
  end
end
