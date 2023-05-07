class RecipesTagsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    tag = Tag.find_or_create_by(name: params[:tag_name])
    recipe_tag = recipe.recipe_tags.create(tag_id: tag.id)
    redirect_to recipe_path(recipe)
  end
end
