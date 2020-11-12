class ResponsePolicy < ApplicationPolicy
  def index?
    user.worker?
  end

  def create?
    user.worker?
  end

  def update?
    user.client?
  end
end
