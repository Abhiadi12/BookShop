class NotificationPolicy < ApplicationPolicy
  def destroy?
    user.id == record.recipient_id
  end
end 