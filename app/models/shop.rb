class Shop < ApplicationRecord
  belongs_to :area
  has_many :reviews
  has_many :scores, through: :reviews

  accepts_nested_attributes_for :reviews

  validates :name, :area_id, presence: true
end
