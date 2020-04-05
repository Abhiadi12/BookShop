class BookDetail < ApplicationRecord
  acts_as_voter
  attr_accessor :quantity # virtual attribute
  has_many_attached :images
  has_many :user_books
  has_many :users, through: :user_books
  belongs_to :author
  belongs_to :category
  before_create :change_case_of_bookname
  #CATEGORY = %w{Select Anthalogy Classic Comic Drama Educational  Fairy-Tale Humor Mystery Mythology Romance Science Biography Essay Reference Poetry  }
  BOOKNAME_REGEX =  /\A[a-zA-Z ]{1,30}\Z/
  validates :name, presence:true ,format: {with: BOOKNAME_REGEX}
  validates :review_of_owner, presence:true , length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "}
  validates :page_count, presence:true , numericality: { only_integer: true, greater_than_or_equal_to:1}
  validate  :images_valid_check
  
  def thumbnail(index)
    self.images[index].variant(resize:'300x300!').processed
  end

  private

  def change_case_of_bookname
    self.name = self.name.downcase.strip
  end

  def images_valid_check
    if images.attached? == false
      errors.add(:images," can't be blank")
    end
    images.each do |image|
      if !image.content_type.in?(%("image/jpeg image/png image/jpg"))
        errors.add(:images," needs to be a valid format")
      end
    end
  end

end
