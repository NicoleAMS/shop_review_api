class Shop < ApplicationRecord
  belongs_to :area
  has_many :reviews
  has_many :scores, through: :reviews

  validates :name, :area_id, presence: true
end
