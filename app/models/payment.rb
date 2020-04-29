class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :user_book , optional: true
end
