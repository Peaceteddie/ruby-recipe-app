class RemoveFoodIdFromIngredients < ActiveRecord::Migration[7.0]
  def change
    remove_column :ingredients, :food_id
  end
end
