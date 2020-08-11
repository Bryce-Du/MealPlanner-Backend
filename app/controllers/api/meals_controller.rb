class Api::MealsController < ApplicationController

    def index
        meals = Meal.all
        render json: MealSerializer.new(meals)
    end

    def create
        meal = Meal.new(meal_params)
        if meal.save
            params["ingredients"].each do |ingr_name|
                ingr = Ingredient.find_by_name(ingr_name)
                MealsIngredient.create(ingredient_id: ingr.id, meal_id: meal.id)
            end
            render json: MealSerializer.new(meal), status: :accepted
        else
            render json: {errors: meal.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        meal = Meal.find(params[:id])
        render json: MealSerializer.new(meal)
    end

    private

    def meal_params
        params.require(:meal).permit(:name, :mealtime)
    end
end