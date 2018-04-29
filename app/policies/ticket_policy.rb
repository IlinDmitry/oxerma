class TicketPolicy < ApplicationPolicy
  def index?
    @user
  end

  def show?
    @user
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
    @user.has_cached_role? :admin, @record
  end

  def destroy?
    @user.has_cached_role? :admin, @record
  end
end