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

  def show
    @recipe = Recipe.includes(:foods).find_by(id: params[:id])
    render json: @recipe.to_json(include: :foods)
  end

  def show_by_slug
    slug = params[:slug]
      slug = URI.decode_uri_component(slug)
      slug = I18n.transliterate(slug)
      slug = slug.downcase.gsub(" ", "-")
      @recipe = Recipe.includes(:foods).find_by(slug: slug)
    
    render json: @recipe.to_json(include: :foods)
  end
end
