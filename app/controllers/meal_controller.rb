class MealController < ApplicationController

    def index
        meals = Meal.all
        render json: meals
    end
end