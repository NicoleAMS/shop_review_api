class Shop < ApplicationRecord
  belongs_to :area
  has_many :reviews
  has_many :scores, through: :reviews
end
