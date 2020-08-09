class MealSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :mealtime
end
