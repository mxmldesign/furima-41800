class User < ApplicationRecord
  has_many :items
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password,
              format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i }
    validates :surname_in_kanji,
              format: {
                with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
              }
    validates :first_name_in_kanji,
              format: {
                with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
              }
    validates :surname_in_kana,
              format: {
                with: /\A[ァ-ヶー]+\z/
              }
    validates :first_name_in_kana,
              format: {
                with: /\A[ァ-ヶー]+\z/
              }
    validates :date_of_birth, presence: true
  end
end
