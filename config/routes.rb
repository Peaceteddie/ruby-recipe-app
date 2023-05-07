Rails.application.routes.draw do

  root "recipes#index"



  get "recipes/:slug", to: "recipes#show_by_slug", as: "recipe_slug"

end

