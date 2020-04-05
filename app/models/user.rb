class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_books , dependent: :destroy
  has_many :book_details, through: :user_books
  has_one_attached :image, dependent: :destroy
  devise :database_authenticatable, :registerable,:recoverable,
         :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:facebook,:google_oauth2]
  acts_as_votable
  before_save :change_username_case
  before_create :add_default_image
  
  USERNAME_REGEX =  /\A[a-zA-Z_]{2,}(^\w|^\.|^!)*[a-zA-Z0-9_]+\Z/
  validates :username,uniqueness: { case_sensitive: false },format: {with: USERNAME_REGEX}
  validate :correct_image_type , on: [:update]
  
  #def self.new_with_session(params, session)
   # super.tap do |user|
    #  if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
     #   user.email = data["email"] if user.email.blank?
      #end
   # end
  #end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a username
      user.skip_confirmation!
    end
  end
 
  private
    def change_username_case
      self.username = self.username.downcase
    end

    def add_default_image
      unless image.attached?
        self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "logo.jpg")), filename: 'default.png' , content_type: "image/png")
      end
    end

    def correct_image_type
      if image.attached? && !image.content_type.in?(%w(image/jpeg image/jpg image/png))
        errors.add(:image , " is not a correct format ")
      elsif !image.attached?
        errors.add(:image , " is not present ")
      end
    end # due to default  i have to only check in update action
end