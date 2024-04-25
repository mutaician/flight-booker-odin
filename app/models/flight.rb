class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'
  has_many :bookings, dependent: :destroy

  validates :departure_airport, :arrival_airport, :start_datetime, presence: true
  validates :passengers, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 4}
  validate :start_datetime_in_range

  private

  def start_datetime_in_range
    if start_datetime < Date.today || start_datetime > Date.today + 23.days
      errors.add(:start_datetime, "must be within 23 days from today")
    end
  end
end
