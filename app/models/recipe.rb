class Recipe < ApplicationRecord

  has_many :foods



  has_many :recipe_tags, class_name: "RecipeTag"



  validates :name, presence: true, uniqueness: true

end

