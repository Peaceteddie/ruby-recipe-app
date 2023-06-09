# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_09_074429) do
  create_table "foods", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_foods_on_name", unique: true
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "food_id", null: false
    t.integer "unit_id", null: false
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_ingredients_on_food_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
    t.index ["unit_id"], name: "index_ingredients_on_unit_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_recipes_on_name", unique: true
  end

  create_table "recipes_tags", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "tag_id", null: false
    t.index ["recipe_id", "tag_id"], name: "index_recipes_tags_on_recipe_id_and_tag_id", unique: true
    t.index ["tag_id", "recipe_id"], name: "index_recipes_tags_on_tag_id_and_recipe_id", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "units", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_units_on_name", unique: true
  end

  add_foreign_key "ingredients", "foods"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "ingredients", "units"
end
