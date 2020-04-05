class Category < ApplicationRecord
  has_one :book_detail
  before_save :category_not_empty

  private
  def category_not_empty
    name = "Others" if name.blank?
  end
end
