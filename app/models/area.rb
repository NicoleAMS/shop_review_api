class Area < ApplicationRecord
  has_many :shops
  has_many :reviews, through: :shops
  has_many :scores, through: :reviews

  accepts_nested_attributes_for :shops

  validates :name, presence: true
end
