class OverviewController < ApplicationController
  def index
    @recipes = Recipe.all
    @ingredients = Ingredient.all
    @foods = Food.all
    @tags = Tag.all
    @units = Unit.all
  end
end
