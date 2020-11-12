class AdvertPolicy < ApplicationPolicy
  def index?
    user.client?
  end

  def new?
    user.client?
  end

  def create?
    user.client?
  end

  def edit?
    user.client? && (record.user == user)
  end

  def update?
    user.client? && (record.user == user)
  end

  def destroy?
    user.client? && (record.user == user)
  end
end
