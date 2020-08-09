class AddMealTimeToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :mealtime, :timestamp
  end
end
