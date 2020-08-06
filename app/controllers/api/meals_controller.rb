class Api::MealsController < ApplicationController

    def index
        meals = Meal.all
        render json: MealSerializer.new(meals)
    end
end