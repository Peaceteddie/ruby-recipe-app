class AddPolymorphicToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :food, polymorphic: true, null: true, index: true
    Ingredient.where(food_type: nil).update_all(food_type: 'None')
    change_column_default :ingredients, :food_type, 'None'
    change_column_null :ingredients, :food_type, false
  end
end
