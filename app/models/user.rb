class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  validates :lastname, presence: true, format: { with: VALID_NAME_REGEX }
  validates :firstname, presence: true, format: { with: VALID_NAME_REGEX }
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :lastnamekana, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :firstnamekana, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :birthday, presence: true
end
