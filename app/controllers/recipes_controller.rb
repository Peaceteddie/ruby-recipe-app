class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render layout: "recipes"
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.save
    render json: @recipe.to_json(include: :foods)
  end

  def create_tag
    recipe = Recipe.find(params[:recipe_id])
    tag = Tag.find_or_create_by(name: params[:tag_name])
    recipe_tag = recipe.recipe_tags.create(recipe_id: recipe.id, tag_id: tag.id)
    redirect_to recipe_path(recipe)
  end

  def create_tag(recipe_id, tag_name)
    recipe = Recipe.includes(:recipe_tags).find(recipe_id)
    tag = Tag.find_or_create_by(name: tag_name)
    recipe_tag = recipe.recipe_tags.create(recipe_id: recipe.id, tag_id: tag.id)
    redirect_to recipe_path(recipe)
  end

  def show_by_slug
    slug = params[:slug]
    if slug.to_i.to_s == slug
      @recipe = Recipe.includes(:foods).find_by(id: slug)
    else
      slug = URI.decode_uri_component(slug)
      slug = I18n.transliterate(slug)
      slug = slug.downcase.gsub(" ", "-")
      @recipe = Recipe.includes(:foods).find_by(slug: slug)
    end
    render json: @recipe.to_json(include: :foods)
  end
end
