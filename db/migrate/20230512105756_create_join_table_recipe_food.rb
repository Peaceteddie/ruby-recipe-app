class CreateJoinTableFoodRecipe < ActiveRecord::Migration[7.0]
  def change
    create_join_table :foods, :recipes do |t|
      t.index %i[food_id recipe_id], unique: true
      t.index %i[recipe_id food_id], unique: true
    end
  end
end
