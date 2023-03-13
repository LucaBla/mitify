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

ActiveRecord::Schema[7.0].define(version: 2023_03_13_034045) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees_university_modules", id: false, force: :cascade do |t|
    t.bigint "attendee_id"
    t.bigint "attended_module_id"
    t.index ["attended_module_id"], name: "index_attendees_university_modules_on_attended_module_id"
    t.index ["attendee_id"], name: "index_attendees_university_modules_on_attendee_id"
  end

  create_table "error_reports", force: :cascade do |t|
    t.string "type", null: false
    t.string "reportType"
    t.text "description"
    t.string "status"
    t.integer "priority"
    t.string "author"
    t.string "eMail"
    t.integer "page"
    t.integer "chapter"
    t.integer "illustrationNumber"
    t.integer "tableNumber"
    t.string "videoTitle"
    t.integer "timestampStart"
    t.integer "timestampEnd"
    t.string "videoURL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "report_date"
    t.bigint "granted_date"
    t.bigint "completed_date"
    t.bigint "mitify_user_id"
    t.bigint "university_module_id"
    t.index ["mitify_user_id"], name: "index_error_reports_on_mitify_user_id"
    t.index ["university_module_id"], name: "index_error_reports_on_university_module_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "mitify_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "first_name"
    t.boolean "active", default: true
    t.bigint "role_id"
    t.index ["email"], name: "index_mitify_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_mitify_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_mitify_users_on_role_id"
  end

  create_table "module", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "responsible_id"
    t.index ["responsible_id"], name: "index_module_on_responsible_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "title"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "university_modules", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "responsible_id"
    t.index ["responsible_id"], name: "index_university_modules_on_responsible_id"
  end

  add_foreign_key "attendees_university_modules", "mitify_users", column: "attendee_id"
  add_foreign_key "attendees_university_modules", "university_modules", column: "attended_module_id"
  add_foreign_key "error_reports", "mitify_users"
  add_foreign_key "mitify_users", "roles"
  add_foreign_key "module", "mitify_users", column: "responsible_id"
  add_foreign_key "university_modules", "mitify_users", column: "responsible_id"
end
