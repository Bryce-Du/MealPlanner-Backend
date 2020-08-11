class MealSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :mealtime, :ingredients
end
