# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all

Ingredient.create(name: "Apple", calories: 95)
Ingredient.create(name: "Banana", calories: 105)
Ingredient.create(name: "Almonds (10)", calories: 78)
Ingredient.create(name: "Lettuce (cup, shredded)", calories: 5)
Ingredient.create(name: "Bread (slice)", calories: 79)
Ingredient.create(name: "Avocado", calories: 322)
Ingredient.create(name: "Pasta (1 lb)", calories: 594)
Ingredient.create(name: "Bacon (slice)", calories: 44)
Ingredient.create(name: "Chicken (1 cup)", calories: 335)
Ingredient.create(name: "Spinach (1 cup)", calories: 7)