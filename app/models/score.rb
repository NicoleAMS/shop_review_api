class Score < ApplicationRecord
  belongs_to :review

  validates :name, :value, :review_id, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end
