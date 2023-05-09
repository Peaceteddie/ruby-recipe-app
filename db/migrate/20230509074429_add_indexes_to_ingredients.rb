class AddIndexesToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_index :ingredients, :recipe_id unless index_exists?(:ingredients, :recipe_id)
    add_index :ingredients, :food_id unless index_exists?(:ingredients, :food_id)
    add_index :ingredients, :unit_id unless index_exists?(:ingredients, :unit_id)
  end
end
