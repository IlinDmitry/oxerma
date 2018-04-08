class SessionPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    !@user
  end

  def destroy?
    @user
  end
end