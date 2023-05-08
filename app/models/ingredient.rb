class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  belongs_to :unit, optional: true
end
