class Score < ApplicationRecord
  belongs_to :review, inverse_of: :scores

  validates :name, :value, :review, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
