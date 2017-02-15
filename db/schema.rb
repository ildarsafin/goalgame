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

ActiveRecord::Schema.define(version: 20170214215231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "coins"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "achievements", force: :cascade do |t|
    t.string "title", null: false
    t.string "badge", null: false
  end

  create_table "achievings", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "achievement_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["achievement_id"], name: "index_achievings_on_achievement_id", using: :btree
    t.index ["user_id"], name: "index_achievings_on_user_id", using: :btree
  end

  create_table "daily_reports", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_daily_reports_on_user_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.text     "description",                 null: false
    t.datetime "start_at",                    null: false
    t.datetime "planned_end_at",              null: false
    t.datetime "actually_end_at",             null: false
    t.integer  "status",          default: 0
    t.integer  "activity_area",   default: 0
    t.integer  "user_id",                     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_goals_on_user_id", using: :btree
  end

  create_table "lazinesses", force: :cascade do |t|
    t.integer "points"
    t.integer "profile_id", null: false
    t.index ["profile_id"], name: "index_lazinesses_on_profile_id", using: :btree
  end

  create_table "personas", force: :cascade do |t|
    t.integer "points"
    t.integer "profile_id", null: false
    t.index ["profile_id"], name: "index_personas_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string  "full_name", null: false
    t.string  "avatar"
    t.integer "user_id",   null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "achievings", "achievements"
  add_foreign_key "achievings", "users"
  add_foreign_key "daily_reports", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "lazinesses", "profiles"
  add_foreign_key "personas", "profiles"
  add_foreign_key "profiles", "users"
end
