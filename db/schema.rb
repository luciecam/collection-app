# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_04_111616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "clothes", force: :cascade do |t|
    t.bigint "factory_id", null: false
    t.bigint "season_id", null: false
    t.bigint "pattern_id", null: false
    t.string "name"
    t.string "reference"
    t.integer "quantity"
    t.integer "confection_cost"
    t.integer "total_cost"
    t.integer "selling_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["factory_id"], name: "index_clothes_on_factory_id"
    t.index ["pattern_id"], name: "index_clothes_on_pattern_id"
    t.index ["season_id"], name: "index_clothes_on_season_id"
  end

  create_table "components", force: :cascade do |t|
    t.string "element_type"
    t.string "supplier"
    t.string "name"
    t.string "reference"
    t.string "description"
    t.string "color"
    t.string "composition"
    t.string "unit"
    t.string "unit_price"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color_hexadecimal"
  end

  create_table "factories", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "speciality"
    t.integer "production_capacity"
    t.integer "moq"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "factory_families", force: :cascade do |t|
    t.bigint "factory_id", null: false
    t.bigint "family_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["factory_id"], name: "index_factory_families_on_factory_id"
    t.index ["family_id"], name: "index_factory_families_on_family_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patterns", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "family_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_patterns_on_family_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.date "beginning_date"
    t.date "ending_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_seasons_on_user_id"
  end

  create_table "technical_details", force: :cascade do |t|
    t.bigint "clothe_id", null: false
    t.bigint "component_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clothe_id"], name: "index_technical_details_on_clothe_id"
    t.index ["component_id"], name: "index_technical_details_on_component_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clothes", "factories"
  add_foreign_key "clothes", "patterns"
  add_foreign_key "clothes", "seasons"
  add_foreign_key "factory_families", "factories"
  add_foreign_key "factory_families", "families"
  add_foreign_key "patterns", "families"
  add_foreign_key "seasons", "users"
  add_foreign_key "technical_details", "clothes"
  add_foreign_key "technical_details", "components"
end
