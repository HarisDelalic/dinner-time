# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
resources = Resource.create([
                              { name: 'all-purpose flour', quantity: 1.00, unit_of_measurement: 'cup' },
                              { name: 'salt', quantity: 1.00, unit_of_measurement: 'teaspoon' },
                              { name: 'sugar', quantity: 1.00, unit_of_measurement: 'tablespoon' },
                              { name: 'egg', quantity: 2.00, unit_of_measurement: 'piece' }
                            ])
