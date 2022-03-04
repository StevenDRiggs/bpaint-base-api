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

ActiveRecord::Schema.define(version: 2022_02_27_203355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analog_color_analog_recipes", force: :cascade do |t|
    t.integer "analog_color_id"
    t.integer "analog_recipe_id"
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["analog_color_id", "analog_recipe_id"], name: "noDupColorsInRecipe", unique: true
  end

  create_table "analog_colors", force: :cascade do |t|
    t.integer "creator_id"
    t.string "body", limit: 50, default: "heavy", null: false
    t.string "brandname", limit: 200
    t.integer "glossiness", default: 100, null: false
    t.string "image_url", limit: 1000, null: false
    t.integer "lightfastness", default: 1, null: false
    t.string "medium", limit: 50, null: false
    t.string "name", limit: 200, null: false
    t.integer "opaqueness", default: 100, null: false
    t.string "series", limit: 200
    t.integer "thickness", default: 75, null: false
    t.integer "tinting", default: 100, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_url"], name: "index_analog_colors_on_image_url", unique: true
    t.index ["name"], name: "index_analog_colors_on_name", unique: true
  end

  create_table "analog_recipes", force: :cascade do |t|
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "digital_colors", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.bigint "_integer_value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["_integer_value"], name: "index_digital_colors_on__integer_value", unique: true
  end

  create_table "package_analog_recipes", force: :cascade do |t|
    t.integer "package_id"
    t.integer "analog_recipe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["package_id", "analog_recipe_id"], name: "index_package_analog_recipes_on_package_id_and_analog_recipe_id", unique: true
  end

  create_table "packages", force: :cascade do |t|
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.index ["name"], name: "index_packages_on_name", unique: true
  end

  create_table "user_package_purchases", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "package_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 50, null: false
    t.string "password_digest", limit: 300, null: false
    t.json "preferences", default: {}, null: false
    t.json "flags", default: {}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin", default: false, null: false
    t.string "email", null: false
    t.string "image_url", default: "https://picsum.photos/200/300", null: false
    t.json "favorites", default: []
    t.json "creations", default: []
  end

end
