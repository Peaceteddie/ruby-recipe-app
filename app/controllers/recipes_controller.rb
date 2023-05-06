class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render layout: "recipes"
  end

  def show_by_slug
    slug = params[:slug]

    # check if slug is integer
    if slug.to_i.to_s == slug
      @recipe = Recipe.includes(:foods).find_by(id: slug)
      render json: @recipe.to_json(include: :foods)
    else
      slug = URI.decode_uri_component(slug)
      slug = I18n.transliterate(slug)
      slug = slug.downcase.gsub(" ", "-")
      @recipe = Recipe.includes(:foods).find_by(slug: slug)
      render json: @recipe.to_json(include: :foods)
    end
  end
end
