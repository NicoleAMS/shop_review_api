class Area < ApplicationRecord
  has_many :shops
  has_many :reviews, through: :shops
  has_many :scores, through: :reviews

  validates :name, presence: true
end
