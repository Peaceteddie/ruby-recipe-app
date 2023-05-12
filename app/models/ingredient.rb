class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  belongs_to :unit

  after_create :create_association_with_recipe

  private

  def create_association_with_recipe
    recipe.foods << food
  end
end
