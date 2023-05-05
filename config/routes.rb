Rails.application.routes.draw do
  get "/recipes", to: "recipes#index"
  get '/recipes/:slug', to: 'recipes#show_by_slug', as: 'recipe_slug'
end
