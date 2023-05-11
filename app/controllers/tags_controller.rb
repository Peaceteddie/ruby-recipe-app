class TagsController < ApplicationController
  def index
    @recipes = Recipe.includes(:tags).all
    @tags = Tag.all
    render layout: 'tags'
  end

  def get_recipe_tags
    tags = Recipe.find(params[:recipe_id]).tags
    render partial: 'tags', locals: { tags:, type: "delete" }
  end
end
