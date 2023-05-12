class TagsController < ApplicationController
  def index
    session.delete(:entries)
    @recipes = Recipe.includes(:tags).all
    @tags = Tag.all
    render layout: 'tags'
  end

  def get_recipe_tags
    tags = Recipe.find(params[:recipe_id]).tags
    render partial: 'tags', locals: { tags:, type: 'delete' }
  end

  def add_tag_to_entries
    session[:entries] ||= []
    session[:entries].append({ id: params[:id], name: params[:name] })
    @entries = session[:entries].map(&:symbolize_keys)
    render partial: 'entries', locals: { entries: @entries }
  end
end
