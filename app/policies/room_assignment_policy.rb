# See https://github.com/elabs/pundit/ for an explanation of the code below
class RoomAssignmentPolicy < ApplicationPolicy
  def index?
    user.is_admin
  end

  def new?
    user.is_admin
  end

  def new_from_pull?
    true
  end

  def show?
    user.is_admin
  end

  def create?
    user.is_admin
  end
  
  def edit?
    user.is_admin
  end

  def update?
    user.is_admin
  end

  def destroy?
    user.is_admin
  end
end
