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

ActiveRecord::Schema.define(version: 20170307184008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["exercise_id"], name: "index_exercise_comments_on_exercise_id", using: :btree
    t.index ["user_id"], name: "index_exercise_comments_on_user_id", using: :btree
  end

  create_table "exercise_files", force: :cascade do |t|
    t.text     "content"
    t.integer  "exercise_id"
    t.string   "file_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["exercise_id"], name: "index_exercise_files_on_exercise_id", using: :btree
  end

  create_table "exercise_submissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.boolean  "completed",   default: false
    t.text     "answer"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["exercise_id"], name: "index_exercise_submissions_on_exercise_id", using: :btree
    t.index ["user_id"], name: "index_exercise_submissions_on_user_id", using: :btree
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "title"
    t.integer  "language_id"
    t.string   "description"
    t.text     "instruction"
    t.integer  "number_of_tests"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["language_id"], name: "index_exercises_on_language_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.datetime "last_seen"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "work_space_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_space_id"
    t.string   "role"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_work_space_users_on_user_id", using: :btree
    t.index ["work_space_id"], name: "index_work_space_users_on_work_space_id", using: :btree
  end

  create_table "work_spaces", force: :cascade do |t|
    t.string   "name"
    t.string   "session_id"
    t.integer  "exercise_id"
    t.integer  "user_id"
    t.integer  "language_id"
    t.text     "user_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["exercise_id"], name: "index_work_spaces_on_exercise_id", using: :btree
    t.index ["language_id"], name: "index_work_spaces_on_language_id", using: :btree
    t.index ["user_id"], name: "index_work_spaces_on_user_id", using: :btree
  end

  add_foreign_key "exercise_comments", "exercises"
  add_foreign_key "exercise_comments", "users"
  add_foreign_key "exercise_files", "exercises"
  add_foreign_key "exercise_submissions", "exercises"
  add_foreign_key "exercise_submissions", "users"
  add_foreign_key "exercises", "languages"
  add_foreign_key "work_space_users", "users"
  add_foreign_key "work_space_users", "work_spaces"
  add_foreign_key "work_spaces", "exercises"
  add_foreign_key "work_spaces", "languages"
  add_foreign_key "work_spaces", "users"
end
