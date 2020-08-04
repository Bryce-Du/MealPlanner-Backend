class CreateMealsIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :meals_ingredients do |t|
      t.belongs_to :ingredient, null: false, foreign_key: true
      t.belongs_to :meal, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
