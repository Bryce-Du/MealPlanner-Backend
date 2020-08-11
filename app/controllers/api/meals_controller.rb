class Api::MealsController < ApplicationController

    def index
        meals = Meal.all
        render json: MealSerializer.new(meals)
    end

    def create
        meal = Meal.new(meal_params)
        if meal.save
            ingr = Ingredient.find_by_name(params["ingredient"])
            join = MealsIngredient.create(ingredient_id: ingr.id, meal_id: meal.id)
            render json: MealSerializer.new(meal), status: :accepted
        else
            render json: {errors: meal.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def meal_params
        params.require(:meal).permit(:name, :mealtime)
    end
end