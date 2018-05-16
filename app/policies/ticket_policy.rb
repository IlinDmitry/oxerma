class TicketPolicy < ApplicationPolicy
  def index?
    @user
  end

  def show?
    true
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    @user
  end

  def update?
    @user.try :has_cached_role?, :admin, @record
  end

  def destroy?
    @user.try :has_cached_role?, :admin, @record
  end
end