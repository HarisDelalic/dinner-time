class Resource < ApplicationRecord
  enum unit_of_measurement: {
    cup: 'cup',
    piece: 'piece',
    teaspoon: 'teaspoon',
    tablespoon: 'tablespoon'
  }

  validates :name, presence: true, uniqueness: true
  validates :unit_of_measurement, inclusion: { in: unit_of_measurements.keys }
end
