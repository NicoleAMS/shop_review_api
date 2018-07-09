class Review < ApplicationRecord
  belongs_to :shop
  has_many :scores
  accepts_nested_attributes_for :scores

  validates :name, :shop_id, presence: true
end
