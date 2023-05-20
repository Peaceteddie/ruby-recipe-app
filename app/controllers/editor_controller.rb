class EditorController < ApplicationController
  def index
    clear_tags_session
    clear_entries_session
    @entries = session[:entries] ||= []
    @ingredients = Ingredient.all
    @recipes = Recipe.all
    @foods = Food.all
    @units = Unit.all
    render layout: 'editor'
  end

  def add_tag
    id = params[:id]
    name = params[:name]

    session[:tags] ||= []
    session[:tags].append({ id:, name: })

    @tags = session[:tags].map(&:symbolize_keys)

    render partial: 'tags', locals: { tags: @tags }
  end

  def remove_tag
    id = params[:id].to_s

    session[:tags] ||= []
    session[:tags].reject! { |tag| tag['id'] == id }

    @tags = session[:tags].map(&:symbolize_keys)

    render partial: 'tags', locals: { tags: @tags }
  end

  def create_entry
    id = params[:id]
    name = params[:name]
    amount = params[:amount]
    unit = params[:unit].to_i
    unit = Unit.find_by(id: unit).name

    session[:entries] ||= []
    session[:entries].append({ id:, name:, amount:, unit: })

    @entries = session[:entries].map(&:symbolize_keys)

    render partial: 'entries', locals: { entries: @entries }
  end

  def delete_entry
    id = params[:id].to_s

    session[:entries] ||= []
    session[:entries].reject! { |entry| entry['id'] == id }

    @entries = session[:entries].map(&:symbolize_keys)

    render partial: 'entries', locals: { entries: @entries }
  end

  def submit_recipe
    name = params[:recipe_name]
    description = params[:recipe_description]

    tags = session[:tags] ||= []
    ingredients = session[:entries] ||= []

    no_name = name.blank?
    no_tags = tags.blank?
    no_description = description.blank?
    no_ingredients = ingredients.blank?

    recipe_exists = Recipe.where('lower(name) = ?', name.downcase).exists?

    return head(:bad_request) if no_name || no_tags || no_description || no_ingredients || recipe_exists

    recipe = Recipe.create(name:, description:)

    ingredients.each do |ingredient|
      ingredient = ingredient.symbolize_keys
      food = Food.find_or_create_by(name: ingredient[:name])
      amount = ingredient[:amount].to_i
      unit = Unit.find_by(name: ingredient[:unit])

      recipe.ingredients << Ingredient.create(recipe:, food:, unit:, amount:)
    end

    tags.each do |tag|
      tag = tag.symbolize_keys
      recipe.tags << Tag.find_or_create_by(name: tag[:name])
    end

    #include recipe[:id] in the response
    render json: { id: recipe.id }
  end

  private

  def clear_tags_session
    session.delete(:tags)
  end

  def clear_entries_session
    session.delete(:entries)
  end
end
