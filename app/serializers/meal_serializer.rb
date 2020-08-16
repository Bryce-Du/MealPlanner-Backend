class MealSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :mealtime, :ingredients, :meals_ingredients
end
