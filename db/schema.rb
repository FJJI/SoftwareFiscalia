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

ActiveRecord::Schema.define(version: 2020_12_07_180209) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "carabineros", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_carabineros_on_user_id"
  end

  create_table "comunas", force: :cascade do |t|
    t.string "comuna"
    t.integer "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_comunas_on_region_id"
  end

  create_table "crime_files", force: :cascade do |t|
    t.integer "crime_id", null: false
    t.string "description"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["crime_id"], name: "index_crime_files_on_crime_id"
    t.index ["user_id"], name: "index_crime_files_on_user_id"
  end

  create_table "crime_tags", force: :cascade do |t|
    t.integer "tag_id"
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "crime_thiefs", force: :cascade do |t|
    t.integer "crime_id", null: false
    t.integer "thief_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "pronunciado"
    t.string "estado"
    t.string "marca"
    t.index ["crime_id"], name: "index_crime_thiefs_on_crime_id"
    t.index ["thief_id"], name: "index_crime_thiefs_on_thief_id"
  end

  create_table "crime_victims", force: :cascade do |t|
    t.integer "crime_id", null: false
    t.integer "victim_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "relato"
    t.index ["crime_id"], name: "index_crime_victims_on_crime_id"
    t.index ["victim_id"], name: "index_crime_victims_on_victim_id"
  end

  create_table "crime_witnesses", force: :cascade do |t|
    t.integer "crime_id", null: false
    t.integer "witness_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "relato"
    t.index ["crime_id"], name: "index_crime_witnesses_on_crime_id"
    t.index ["witness_id"], name: "index_crime_witnesses_on_witness_id"
  end

  create_table "crimes", force: :cascade do |t|
    t.string "title"
    t.string "labels"
    t.string "place"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "estado"
    t.string "region"
    t.string "comuna"
    t.datetime "fecha"
    t.integer "carabineros_id"
    t.string "fcargo"
    t.string "ccargo"
    t.integer "fiscals_id"
    t.index ["carabineros_id"], name: "index_crimes_on_carabineros_id"
    t.index ["fiscals_id"], name: "index_crimes_on_fiscals_id"
  end

  create_table "fiscals", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_fiscals_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "crime_id"
  end

  create_table "regions", force: :cascade do |SQLite3::SQLException: no such column: t|
    t.string "region"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "thiefs", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "tags"
    t.string "alias_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "estado"
  end

  create_table "uccs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "carabineros_id", null: false
    t.index ["carabineros_id"], name: "index_uccs_on_carabineros_id"
    t.index ["user_id"], name: "index_uccs_on_user_id"
  end

  create_table "ufcs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fiscals_id"
    t.integer "carabineros_id"
    t.index ["carabineros_id"], name: "index_ufcs_on_carabineros_id"
    t.index ["fiscals_id"], name: "index_ufcs_on_fiscals_id"
  end

  create_table "ufs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "fiscals_id"
    t.index ["fiscals_id"], name: "index_ufs_on_fiscals_id"
    t.index ["user_id"], name: "index_ufs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "rut"
    t.string "job"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "region"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "victims", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.integer "age"
    t.string "detalle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "witnesses", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.integer "age"
    t.string "detalle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "carabineros", "users"
  add_foreign_key "comunas", "regions"
  add_foreign_key "crime_files", "crimes"
  add_foreign_key "crime_files", "users"
  add_foreign_key "crime_thiefs", "crimes"
  add_foreign_key "crime_thiefs", "thiefs"
  add_foreign_key "crime_victims", "crimes"
  add_foreign_key "crime_victims", "victims"
  add_foreign_key "crime_witnesses", "crimes"
  add_foreign_key "crime_witnesses", "witnesses"
  add_foreign_key "crimes", "carabineros", column: "carabineros_id"
  add_foreign_key "crimes", "fiscals", column: "fiscals_id"
  add_foreign_key "fiscals", "users"
  add_foreign_key "uccs", "carabineros", column: "carabineros_id"
  add_foreign_key "uccs", "users"
  add_foreign_key "ufcs", "carabineros", column: "carabineros_id"
  add_foreign_key "ufcs", "fiscals", column: "fiscals_id"
  add_foreign_key "ufs", "fiscals", column: "fiscals_id"
  add_foreign_key "ufs", "users"
end
