class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  devise :omniauthable, omniauth_providers: [:facebook,:google]
  acts_as_votable
  validates :username,uniqueness: true,format: {with:VALID_USERNAME_REGEX}
  
end
