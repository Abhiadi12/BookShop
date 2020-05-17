class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_one :subscriptions, dependent: :destroy
end
