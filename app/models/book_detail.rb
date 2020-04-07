class BookDetail < ApplicationRecord
  acts_as_voter
  belongs_to :author
  belongs_to :category
  has_many :user_books
  has_many :users, through: :user_books
  before_create :change_case_of_bookname

  private
  
  def change_case_of_bookname
    self.name = self.name.downcase.strip
  end

end
