class EditorController < ApplicationController
  # before_action :clear_entries_session, except: [:index]

  def index
    clear_entries_session
    @recipes = Recipe.all
    @ingredients = Ingredient.all
    @foods = Food.all
    @units = Unit.all
    @entries = session[:entries] ||= []
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

    flash[:notice] = 'Entry was successfully created.'

    render partial: 'entries', locals: { entries: @entries }

    puts @entries
  end

  def delete_entry
    id = params[:id].to_s

    session[:entries] ||= []
    session[:entries].reject! { |entry| entry['id'] == id }

    @entries = session[:entries].map(&:symbolize_keys)

    flash[:notice] = 'Entry was successfully deleted.'

    render partial: 'entries', locals: { entries: @entries }
  end

  private

  def clear_entries_session
    session.delete(:entries)
  end
end
