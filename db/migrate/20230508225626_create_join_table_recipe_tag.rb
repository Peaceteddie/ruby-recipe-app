class CreateJoinTableRecipeTag < ActiveRecord::Migration[7.0]
  def change
    create_join_table :recipes, :tags do |t|
      t.index %i[recipe_id tag_id], unique: true
      t.index %i[tag_id recipe_id], unique: true
    end
  end
end
