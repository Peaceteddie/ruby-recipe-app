Rails.application.routes.draw do
  root 'recipes#index'
  get 'recipes' => 'recipes#index'
  get 'recipes/:id' => 'recipes#fetch'

  get 'overview' => 'overview#index'

  get 'editor' => 'editor#index', as: 'editor'
  post 'editor/create_entry' => 'editor#create_entry'
  delete 'editor/delete_entry' => 'editor#delete_entry'

  get 'tags' => 'tags#index', as: 'tags'
  post 'tags' => 'tags#create'
  delete 'tags' => 'tags#delete'

  get 'tags/recipe/:recipe_id' => 'tags#get_recipe_tags'
end
