class Category < ApplicationRecord
  has_one :book_detail
=begin  private
  def category_not_empty
    self.name = "Others" if self.name.blank?
  end
=end
end
