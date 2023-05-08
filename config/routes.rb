Rails.application.routes.draw do
  root 'recipes#index'
  get 'recipes' => 'recipes#index'

  get 'recipes/:id' => 'recipes#show'

  get 'overview' => 'overview#index'

  get 'editor' => 'editor#index'
end
