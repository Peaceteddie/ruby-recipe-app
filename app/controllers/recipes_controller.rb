class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:tags)
    render layout: 'recipes'
  end

  def fetch
    @selected = Recipe.includes(:tags, ingredients: :unit).find(params[:id])
    render partial: 'details', locals: { recipe: @selected }
  end

  def show
    @recipe = Recipe.includes(:tags).find(params[:id])
    @ingredients = Ingredient.where(recipe_id: @recipe.id).includes(:unit, :food)
    @ingredients = @ingredients.map do |ingredient|
      {
        id: ingredient.id,
        food: ingredient.food.name,
        unit: ingredient.unit.name,
        amount: ingredient.amount,
        created_at: ingredient.created_at,
        updated_at: ingredient.updated_at
      }.except(:unit_id, :food_id, :recipe_id)
    end
    render json: { recipe: @recipe, ingredients: @ingredients }
  end
end
