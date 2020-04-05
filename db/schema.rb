# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_05_180628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

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

  create_table "categories", force: :cascade do |t|
    t.boolean "has_subcategory", default: true
    t.bigint "navbar_base_folder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["navbar_base_folder_id"], name: "index_categories_on_navbar_base_folder_id"
  end

  create_table "category_translations", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["category_id"], name: "index_category_translations_on_category_id"
    t.index ["locale"], name: "index_category_translations_on_locale"
  end

  create_table "infographics", force: :cascade do |t|
    t.string "title"
    t.bigint "sub_category_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "secret_category_id"
    t.bigint "secret_sub_category_id"
    t.boolean "english?", default: true
    t.boolean "pinned?", default: false
    t.index ["category_id"], name: "index_infographics_on_category_id"
    t.index ["secret_category_id"], name: "index_infographics_on_secret_category_id"
    t.index ["secret_sub_category_id"], name: "index_infographics_on_secret_sub_category_id"
    t.index ["sub_category_id"], name: "index_infographics_on_sub_category_id"
  end

  create_table "navbar_base_folder_translations", force: :cascade do |t|
    t.bigint "navbar_base_folder_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_navbar_base_folder_translations_on_locale"
    t.index ["navbar_base_folder_id"], name: "index_navbar_base_folder_translations_on_navbar_base_folder_id"
  end

  create_table "navbar_base_folders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pdf_translations", force: :cascade do |t|
    t.bigint "pdf_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["locale"], name: "index_pdf_translations_on_locale"
    t.index ["pdf_id"], name: "index_pdf_translations_on_pdf_id"
  end

  create_table "pdfs", force: :cascade do |t|
    t.bigint "sub_category_id"
    t.bigint "category_id"
    t.bigint "secret_category_id"
    t.bigint "secret_sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "english?", default: true
    t.boolean "pinned?", default: false
    t.index ["category_id"], name: "index_pdfs_on_category_id"
    t.index ["secret_category_id"], name: "index_pdfs_on_secret_category_id"
    t.index ["secret_sub_category_id"], name: "index_pdfs_on_secret_sub_category_id"
    t.index ["sub_category_id"], name: "index_pdfs_on_sub_category_id"
  end

  create_table "secret_categories", force: :cascade do |t|
    t.bigint "secret_navbar_base_folder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_secret_subcategory", default: true
    t.index ["secret_navbar_base_folder_id"], name: "index_secret_categories_on_secret_navbar_base_folder_id"
  end

  create_table "secret_category_translations", force: :cascade do |t|
    t.bigint "secret_category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_secret_category_translations_on_locale"
    t.index ["secret_category_id"], name: "index_secret_category_translations_on_secret_category_id"
  end

  create_table "secret_navbar_base_folder_translations", force: :cascade do |t|
    t.bigint "secret_navbar_base_folder_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_secret_navbar_base_folder_translations_on_locale"
    t.index ["secret_navbar_base_folder_id"], name: "index_03e5858886da6c5509c85b7814b1cb9b0f1046d5"
  end

  create_table "secret_navbar_base_folders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secret_sub_categories", force: :cascade do |t|
    t.bigint "secret_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["secret_category_id"], name: "index_secret_sub_categories_on_secret_category_id"
  end

  create_table "secret_sub_category_translations", force: :cascade do |t|
    t.bigint "secret_sub_category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_secret_sub_category_translations_on_locale"
    t.index ["secret_sub_category_id"], name: "index_49f4f00142275957c56166733906e86deeb7d228"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "sub_category_translations", force: :cascade do |t|
    t.bigint "sub_category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_sub_category_translations_on_locale"
    t.index ["sub_category_id"], name: "index_sub_category_translations_on_sub_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_translations", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["locale"], name: "index_video_translations_on_locale"
    t.index ["video_id"], name: "index_video_translations_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "url"
    t.bigint "sub_category_id"
    t.bigint "category_id"
    t.bigint "secret_category_id"
    t.bigint "secret_sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "english?", default: true
    t.boolean "pinned?", default: false
    t.index ["category_id"], name: "index_videos_on_category_id"
    t.index ["secret_category_id"], name: "index_videos_on_secret_category_id"
    t.index ["secret_sub_category_id"], name: "index_videos_on_secret_sub_category_id"
    t.index ["sub_category_id"], name: "index_videos_on_sub_category_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "navbar_base_folders"
  add_foreign_key "infographics", "categories"
  add_foreign_key "infographics", "secret_categories"
  add_foreign_key "infographics", "secret_sub_categories"
  add_foreign_key "infographics", "sub_categories"
  add_foreign_key "pdfs", "categories"
  add_foreign_key "pdfs", "secret_categories"
  add_foreign_key "pdfs", "secret_sub_categories"
  add_foreign_key "pdfs", "sub_categories"
  add_foreign_key "secret_categories", "secret_navbar_base_folders"
  add_foreign_key "secret_sub_categories", "secret_categories"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "videos", "categories"
  add_foreign_key "videos", "secret_categories"
  add_foreign_key "videos", "secret_sub_categories"
  add_foreign_key "videos", "sub_categories"
end
