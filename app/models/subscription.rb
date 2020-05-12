class Subscription < ApplicationRecord
  belongs_to :chat
  belongs_to :user # here user_id is act like the receiver id
end
