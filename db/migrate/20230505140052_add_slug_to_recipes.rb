class AddSlugToRecipes < ActiveRecord::Migration[7.0]

  def change

    add_column :recipes, :slug, :string, unique: true



    Recipe.all.each do |recipe|

      recipe.update(slug: recipe.name.parameterize)

    end

  end

end

