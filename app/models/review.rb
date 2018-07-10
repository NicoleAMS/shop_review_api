class Review < ApplicationRecord
  belongs_to :shop
  has_many :scores, inverse_of: :review
  accepts_nested_attributes_for :scores

  validates :name, :shop, presence: true
end
