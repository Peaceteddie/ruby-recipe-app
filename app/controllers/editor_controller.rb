class EditorController < ApplicationController
  def index
    @recipes = Recipe.all
    @foods = Food.all
    @units = Unit.all
    render layout: "application"
  end
end
