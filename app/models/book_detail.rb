class BookDetail < ApplicationRecord
  acts_as_voter
  belongs_to :author
  belongs_to :category
end
