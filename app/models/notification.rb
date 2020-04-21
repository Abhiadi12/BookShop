class Notification < ApplicationRecord
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User" #must be a.recipient inorder to access the user
  belongs_to :user_book
end
