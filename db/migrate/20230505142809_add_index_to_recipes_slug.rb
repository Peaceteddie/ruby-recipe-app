class AddIndexToRecipesSlug < ActiveRecord::Migration[7.0]
  def change
    unless index_exists?(:recipes, :slug)
      add_index :recipes, :slug, unique: true
    end
  end
end
