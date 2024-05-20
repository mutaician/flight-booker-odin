class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, dependent: :destroy

  accepts_nested_attributes_for :passengers

  validates :flight, :passengers, presence: true
  # validates :passengers, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 4}
end
