class EditorController < ApplicationController
  def index
    clear_entries_session
    @entries = session[:entries] ||= []
    @ingredients = Ingredient.all
    @recipes = Recipe.all
    @foods = Food.all
    @units = Unit.all
    render layout: 'editor'
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

  private

  def clear_entries_session
    session.delete(:entries)
  end
end
