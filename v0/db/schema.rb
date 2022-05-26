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

ActiveRecord::Schema.define(version: 2022_05_26_060941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "analog_colors", force: :cascade do |t|
    t.string "slug", null: false
    t.string "image_url", null: false
    t.string "name", null: false
    t.string "body"
    t.string "brandname"
    t.integer "glossiness"
    t.integer "lightfastness"
    t.string "medium"
    t.integer "opaqueness"
    t.string "series"
    t.integer "thickness"
    t.integer "tinting"
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_url"], name: "index_analog_colors_on_image_url", unique: true
    t.index ["name", "body", "brandname", "glossiness", "lightfastness", "medium", "opaqueness", "series", "thickness", "tinting"], name: "unique_analog_colors", unique: true
    t.index ["slug"], name: "index_analog_colors_on_slug", unique: true
  end

  create_table "digital_colors", force: :cascade do |t|
    t.string "name"
    t.bigint "UID", null: false
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["UID"], name: "index_digital_colors_on_UID", unique: true
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
    t.json "favorites", default: {"packages"=>[], "recipes"=>[], "analog_colors"=>[], "digital_colors"=>[]}
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "analog_colors", "users", column: "creator_id"
  add_foreign_key "digital_colors", "users", column: "creator_id"
end
