class OverviewController < ApplicationController
  def index
    @recipes = Recipe.all
    @ingredients = Ingredient.all
    @foods = Food.all
    @tags = Tags.all
  end
end
