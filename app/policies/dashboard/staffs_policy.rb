class Dashboard::StaffsPolicy < ApplicationPolicy
  def index?
    user.administrator?
  end

  def show?
    user.administrator?
  end

  def edit?
    user.administrator?
  end

  def update?
    user.administrator?
  end

  def destroy?
    user.administrator?
  end
end
