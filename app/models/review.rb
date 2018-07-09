class Review < ApplicationRecord
  belongs_to :shop
  has_many :scores

  validates :name, :shop_id, presence: true
end
