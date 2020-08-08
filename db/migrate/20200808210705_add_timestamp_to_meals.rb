class AddTimestampToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :datetime, :timestamp
  end
end
