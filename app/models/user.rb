class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with options presence true do
  validates :nickname
  validates :encrypted_password, length:{minimum:6},format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :family_name, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :first_name, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birth_day
end
