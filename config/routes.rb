Rails.application.routes.draw do
  # scope "/recipe-app" do
  ### RECIPES ############################################
  root 'recipes#index'
  get 'recipes' => 'recipes#index'
  get 'recipes/:id' => 'recipes#fetch'
  ########################################################

  ### OVERVIEW ###########################################
  get 'overview' => 'overview#index'
  ########################################################

  ### EDITOR #############################################
  get 'editor' => 'editor#index', as: 'editor'
  post 'editor/add_tag' => 'editor#add_tag'
  delete 'editor/remove_tag' => 'editor#remove_tag'
  post 'editor/create_entry' => 'editor#create_entry'
  delete 'editor/delete_entry' => 'editor#delete_entry'
  post 'editor/submit_recipe' => 'editor#submit_recipe'
  ########################################################

  ### TAGS ###############################################
  get 'tags' => 'tags#index', as: 'tags'
  post 'tags' => 'tags#create'
  delete 'tags' => 'tags#delete'
  get 'tags/recipe/:recipe_id' => 'tags#get_recipe_tags'
  ########################################################

  ### CATCH ALL ##########################################
  get ':id' => 'recipes#index'
  ########################################################
  # end
end
