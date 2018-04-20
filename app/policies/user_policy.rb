class UserPolicy < ApplicationPolicy
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

  def settings?
    update?
  end

  def create?
    !@user
  end

  def update?
    @user.id.eql? @record.id
  end

  def destroy?
    @user.id.eql?(@record.id) && !@record.has_dependencies?
  end
end