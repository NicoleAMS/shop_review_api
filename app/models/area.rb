class Area < ApplicationRecord
  has_many :shops
  has_many :reviews, through: :shops
  has_many :scores, through: :reviews

  accepts_nested_attributes_for :shops

  validates :name, presence: true

  def total_area_value(area)
    total_value = 0
    area.shops.map do |shop|
      shop.reviews.map do |review|
        review.scores.map do |score|
          total_value += score.value
        end
      end
    end
    total_value
  end
end
