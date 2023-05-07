Rails.application.routes.draw do
  root "recipes#index"
  get "recipes/:id", to: "recipes#show", as: "recipe"
  get "recipes/:slug", to: "recipes#show_by_slug", as: "recipe_slug"

  get "recipes/:id/edit", to: "recipes#edit", as: "edit_recipe"
  patch "recipes/:id", to: "recipes#update"

  get "recipes/new", to: "recipes#new", as: "new_recipe"
  post "recipes", to: "recipes#create"

  delete "recipes/:id", to: "recipes#destroy"

  get "recipes/:id/tags", to: "recipes#tags", as: "recipe_tags"
  post "recipes/:id/tags", to: "recipes#create_tag", as: "create_recipe_tag"
  delete "recipes/:id/tags/:tag_id", to: "recipes#destroy_tag", as: "destroy_recipe_tag"

  get "tags", to: "tags#index", as: "tags"
end

