class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
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
