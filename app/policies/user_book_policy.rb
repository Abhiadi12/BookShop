class UserBookPolicy < ApplicationPolicy
  def destroy?
    user.id == record.user_id or user.id == 2 # admin is id 2
  end
end
