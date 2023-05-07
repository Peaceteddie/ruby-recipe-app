class Tag < ApplicationRecord
  has_many :recipe_tags, class_name: "RecipeTag"
end
