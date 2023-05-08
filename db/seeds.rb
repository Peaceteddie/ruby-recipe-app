Unit.destroy_all
Ingredient.destroy_all
Recipe.destroy_all

Unit.find_or_create_by(name: 'teaspoon')
Unit.find_or_create_by(name: 'tablespoon')

Unit.find_or_create_by(name: 'milliliter')
Unit.find_or_create_by(name: 'deciliter')
Unit.find_or_create_by(name: 'liter')

Unit.find_or_create_by(name: 'milligram')
Unit.find_or_create_by(name: 'gram')
Unit.find_or_create_by(name: 'kilogram')

recipe = Recipe.find_or_create_by(name: 'Pancakes', description: 'A delicious breakfast treat')
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Flour'), amount: 2,
                                     unit: Unit.find_by(name: 'deciliter'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Milk'), amount: 5,
                                     unit: Unit.find_by(name: 'deciliter'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Egg'), amount: 2)
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Butter'), amount: 2,
                                     unit: Unit.find_by(name: 'tablespoon'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Salt'), amount: 1,
                                     unit: Unit.find_by(name: 'teaspoon'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Sugar'), amount: 1,
                                     unit: Unit.find_by(name: 'tablespoon'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Baking powder'), amount: 2,
                                     unit: Unit.find_by(name: 'teaspoon'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Vanilla sugar'), amount: 1,
                                     unit: Unit.find_by(name: 'teaspoon'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Oil'), amount: 1,
                                     unit: Unit.find_by(name: 'tablespoon'))

recipe = Recipe.find_or_create_by(name: 'Meatballs', description: 'A delicious dinner treat')
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Ground beef'), amount: 500,
                                     unit: Unit.find_by(name: 'gram'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Bread crumbs'), amount: 1,
                                     unit: Unit.find_by(name: 'deciliter'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Milk'), amount: 1,
                                     unit: Unit.find_by(name: 'deciliter'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Egg'), amount: 1)
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Salt'), amount: 1,
                                     unit: Unit.find_by(name: 'teaspoon'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Pepper'), amount: 1,
                                     unit: Unit.find_by(name: 'teaspoon'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Onion'), amount: 1)
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Butter'), amount: 2,
                                     unit: Unit.find_by(name: 'tablespoon'))
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Potato'), amount: 6)
recipe.ingredients.find_or_create_by(food: Food.find_or_create_by(name: 'Lingonberry jam'), amount: 1,
                                     unit: Unit.find_by(name: 'deciliter'))
