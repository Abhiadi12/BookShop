class UserBook < ApplicationRecord
  acts_as_votable
  attr_accessor :name
  belongs_to :user
  belongs_to :book_detail
  has_many_attached :images , dependent: :destroy
  has_many :notifications,dependent: :destroy
  #BOOKNAME_REGEX =  /\A[a-zA-Z ]{1,30}\Z/
  #validates :name, presence:true ,format: {with: BOOKNAME_REGEX}
  validates :review, presence:true , length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "} , on: :create
  validates :page_count, presence:true , numericality: { only_integer: true, greater_than_or_equal_to:1} , on: :create

  validate  :images_valid_check , on: :create
  
  def thumbnail(index)
    self.images[index].variant(resize:'400x300!').processed
  end

  def resize_image_for_home_page
    self.images[0].variant(resize:'160x220!').processed
  end

  private
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