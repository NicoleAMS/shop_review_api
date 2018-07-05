class Score < ApplicationRecord
  belongs_to :review

  validates :name, :value, presence: true
  validates :value, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end
