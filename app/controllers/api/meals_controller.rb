class Api::MealsController < ApplicationController

    def index
        meals = Meal.all
        render json: MealSerializer.new(meals)
    end

    def create
        meal = Meal.new(meal_params)
        if meal.save
            params["ingredients"].each do |ingr_hash|
                ingr = Ingredient.find_by_name(ingr_hash["name"])
                MealsIngredient.create(ingredient_id: ingr.id, meal_id: meal.id, quantity: ingr_hash["quantity"])
            end
            render json: MealSerializer.new(meal), status: :accepted
        else
            render json: {errors: meal.errors.full_messages}, status: :unprocessable_entity
        end
    end

    # show is possibly unnecessary now
    def show
        meal = Meal.find(params[:id])
        render json: MealSerializer.new(meal)
    end

    def update
        meal = Meal.find(params[:id])
        MealsIngredient.destroy(meal.meals_ingredients.map{|mi| mi.id})
        meal.meals_ingredients.clear
        params["ingredients"].each do |ingr_hash|
            ingr = Ingredient.find_by_name(ingr_hash["name"])
            mi = MealsIngredient.create(ingredient_id: ingr.id, meal_id: meal.id, quantity: ingr_hash["quantity"])
            meal.meals_ingredients << mi
        end
        if meal.update(name: meal_params[:name])
            
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