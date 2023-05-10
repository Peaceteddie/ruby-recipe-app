Rails.application.routes.draw do
  root 'recipes#index'
  get 'recipes' => 'recipes#index'
  get 'recipes/:id' => 'recipes#fetch'

  get 'overview' => 'overview#index'

  get 'editor' => 'editor#index', as: 'editor'
  post 'editor/create_entry' => 'editor#create_entry'
  delete 'editor/delete_entry' => 'editor#delete_entry'
end
