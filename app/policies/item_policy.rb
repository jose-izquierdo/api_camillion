class ItemPolicy < ApplicationPolicy
  def index?
    user.has_any_role? :admin, :user
  end
  
  def create?
    user.has_role? :admin
  end
end