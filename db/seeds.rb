Ingredient.destroy_all
Tag.destroy_all
Unit.destroy_all
Recipe.destroy_all

ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE NAME='ingredients'")
ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE NAME='recipes'")
ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE NAME='units'")
ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE NAME='tags'")

units = %w[
  whole
  half
  quarter
  eighth
  clove
  bulb
  head
  slice
  smidgen
  pinch
  dash
  teaspoon
  tablespoon
  drop
  milliliter
  deciliter
  liter
  milligram
  gram
  kilogram
]

units.each do |name|
  Unit.create(name:)
end

### Pancakes ###
recipe = Recipe.create(name: 'Pancakes', description: 'A delicious breakfast treat')

ingredients = [
  { name: 'Flour', amount: 3, unit: 'deciliter' },
  { name: 'Milk', amount: 5, unit: 'deciliter' },
  { name: 'Egg', amount: 2, unit: 'whole' },
  { name: 'Butter', amount: 2, unit: 'tablespoon' },
  { name: 'Salt', amount: 1, unit: 'teaspoon' },
  { name: 'Sugar', amount: 1, unit: 'tablespoon' },
  { name: 'Baking powder', amount: 2, unit: 'teaspoon' },
  { name: 'Vanilla sugar', amount: 1, unit: 'teaspoon' },
  { name: 'Oil', amount: 1, unit: 'tablespoon' }
]

ingredients.each do |ingredient|
  food = Food.find_or_create_by(name: ingredient[:name])
  amount = ingredient[:amount].to_i
  unit = Unit.find_by(name: ingredient[:unit])
  recipe.ingredients << Ingredient.create(food:, amount:, unit:)
end

tags = %w[
  Breakfast
  Dessert
  Vegetarian
  Sweet
  Easy
  Quick
]

tags.each do |tag|
  recipe.tags << Tag.find_or_create_by(name: tag)
end

### Meatballs ###
recipe = Recipe.create(name: 'Meatballs', description: 'A delicious dinner treat')

ingredients = [
  { name: 'Ground beef', amount: 500, unit: 'gram' },
  { name: 'Bread crumbs', amount: 1, unit: 'deciliter' },
  { name: 'Milk', amount: 1, unit: 'deciliter' },
  { name: 'Egg', amount: 1, unit: 'whole' },
  { name: 'Salt', amount: 1, unit: 'teaspoon' },
  { name: 'Pepper', amount: 1, unit: 'teaspoon' },
  { name: 'Butter', amount: 1, unit: 'tablespoon' },
  { name: 'Flour', amount: 1, unit: 'tablespoon' },
  { name: 'Water', amount: 5, unit: 'deciliter' },
  { name: 'Potatoes', amount: 10, unit: 'whole' },
  { name: 'Lingonberry jam', amount: 1, unit: 'deciliter' }
]

ingredients.each do |ingredient|
  food = Food.find_or_create_by(name: ingredient[:name])
  amount = ingredient[:amount].to_i
  unit = Unit.find_by(name: ingredient[:unit])
  recipe.ingredients << Ingredient.create(food:, amount:, unit:)
end

tags = %w[
  Dinner
  Meat
  Swedish
  Easy
  Quick
]

tags.each do |tag|
  recipe.tags << Tag.find_or_create_by(name: tag)
end
