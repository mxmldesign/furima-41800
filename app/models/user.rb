class User < ApplicationRecord
  has_many :items
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :surname_in_kanji, presence: true
  validates :first_name_in_kanji, presence: true
  validates :surname_in_kana, presence: true
  validates :first_name_in_kana, presence: true
  validates :date_of_birth, presence: true
end
