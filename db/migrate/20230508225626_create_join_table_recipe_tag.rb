class CreateJoinTableRecipeTag < ActiveRecord::Migration[7.0]
  def change
    return if table_exists?(:recipes_tags)

    create_join_table :recipes, :tags do |t|
      t.index %i[recipe_id tag_id]
      t.index %i[tag_id recipe_id]
      t.index %i[tag_id recipe_id], unique: true
    end
  end
end
