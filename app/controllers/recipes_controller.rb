class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render layout: "recipes"
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
