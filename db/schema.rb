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

ActiveRecord::Schema[7.2].define(version: 2025_06_08_210731) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "introduction"
    t.text "intro_photo"
    t.text "body"
    t.date "date"
    t.integer "position"
    t.bigint "category_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_articles_on_author_id"
    t.index ["category_id"], name: "index_articles_on_category_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "bio"
    t.text "avatar"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "email"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "position"
    t.bigint "main_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_category_id"], name: "index_categories_on_main_category_id"
  end

  create_table "fae_changes", force: :cascade do |t|
    t.integer "changeable_id"
    t.string "changeable_type"
    t.integer "user_id"
    t.string "change_type"
    t.text "updated_attributes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["changeable_id"], name: "index_fae_changes_on_changeable_id"
    t.index ["changeable_type"], name: "index_fae_changes_on_changeable_type"
    t.index ["user_id"], name: "index_fae_changes_on_user_id"
  end

  create_table "fae_deploy_hooks", force: :cascade do |t|
    t.string "url"
    t.string "environment"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "position"
    t.index ["environment"], name: "index_fae_deploy_hooks_on_environment"
    t.index ["position"], name: "index_fae_deploy_hooks_on_position"
  end

  create_table "fae_files", force: :cascade do |t|
    t.string "name"
    t.string "asset"
    t.string "fileable_type"
    t.bigint "fileable_id"
    t.integer "file_size"
    t.integer "position", default: 0
    t.string "attached_as"
    t.boolean "on_stage", default: true
    t.boolean "on_prod", default: false
    t.boolean "required", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attached_as"], name: "index_fae_files_on_attached_as"
    t.index ["fileable_type", "fileable_id"], name: "index_fae_files_on_fileable_type_and_fileable_id"
  end

  create_table "fae_form_managers", force: :cascade do |t|
    t.string "form_manager_model_name"
    t.integer "form_manager_model_id"
    t.text "fields"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["form_manager_model_id"], name: "index_fae_form_managers_on_form_manager_model_id"
    t.index ["form_manager_model_name"], name: "index_fae_form_managers_on_form_manager_model_name"
  end

  create_table "fae_images", force: :cascade do |t|
    t.string "name"
    t.string "asset"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.string "alt"
    t.string "caption"
    t.integer "position", default: 0
    t.string "attached_as"
    t.boolean "on_stage", default: true
    t.boolean "on_prod", default: false
    t.integer "file_size"
    t.boolean "required", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attached_as"], name: "index_fae_images_on_attached_as"
    t.index ["imageable_type", "imageable_id"], name: "index_fae_images_on_imageable_type_and_imageable_id"
  end

  create_table "fae_options", force: :cascade do |t|
    t.string "title"
    t.string "time_zone"
    t.string "colorway"
    t.string "stage_url"
    t.string "live_url"
    t.integer "singleton_guard"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["singleton_guard"], name: "index_fae_options_on_singleton_guard", unique: true
  end

  create_table "fae_roles", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fae_seo_sets", force: :cascade do |t|
    t.string "seo_title"
    t.text "seo_description"
    t.string "social_media_title"
    t.text "social_media_description"
    t.string "seo_setable_type"
    t.bigint "seo_setable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seo_setable_type", "seo_setable_id"], name: "index_fae_seo_sets_on_seo_setable"
  end

  create_table "fae_static_pages", force: :cascade do |t|
    t.string "title"
    t.integer "position", default: 0
    t.boolean "on_stage", default: true
    t.boolean "on_prod", default: false
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_fae_static_pages_on_slug"
  end

  create_table "fae_text_areas", force: :cascade do |t|
    t.string "label"
    t.text "content"
    t.integer "position", default: 0
    t.boolean "on_stage", default: true
    t.boolean "on_prod", default: false
    t.integer "contentable_id"
    t.string "contentable_type"
    t.string "attached_as"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attached_as"], name: "index_fae_text_areas_on_attached_as"
    t.index ["contentable_id"], name: "index_fae_text_areas_on_contentable_id"
    t.index ["contentable_type"], name: "index_fae_text_areas_on_contentable_type"
    t.index ["on_prod"], name: "index_fae_text_areas_on_on_prod"
    t.index ["on_stage"], name: "index_fae_text_areas_on_on_stage"
    t.index ["position"], name: "index_fae_text_areas_on_position"
  end

  create_table "fae_text_fields", force: :cascade do |t|
    t.string "contentable_type"
    t.bigint "contentable_id"
    t.string "attached_as"
    t.string "label"
    t.string "content"
    t.integer "position", default: 0
    t.boolean "on_stage", default: true
    t.boolean "on_prod", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attached_as"], name: "index_fae_text_fields_on_attached_as"
    t.index ["contentable_type", "contentable_id"], name: "index_fae_text_fields_on_contentable_type_and_contentable_id"
    t.index ["on_prod"], name: "index_fae_text_fields_on_on_prod"
    t.index ["on_stage"], name: "index_fae_text_fields_on_on_stage"
    t.index ["position"], name: "index_fae_text_fields_on_position"
  end

  create_table "fae_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at", precision: nil
    t.string "first_name"
    t.string "last_name"
    t.integer "role_id"
    t.boolean "active"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_fae_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_fae_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_fae_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_fae_users_on_role_id"
    t.index ["unlock_token"], name: "index_fae_users_on_unlock_token", unique: true
  end

  create_table "main_categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "image"
    t.text "description"
    t.integer "limit"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "authors"
  add_foreign_key "articles", "categories"
  add_foreign_key "categories", "main_categories"
end
