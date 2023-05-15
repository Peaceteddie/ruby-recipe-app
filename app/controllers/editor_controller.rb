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
    ingredients = params[:recipe_ingredients]

    return head(:bad_request) if name.blank? or ingredients.blank? or Recipes.find_by(name:).present?
  end

  private

  def clear_tags_session
    session.delete(:tags)
  end

  def clear_entries_session
    session.delete(:entries)
  end
end
