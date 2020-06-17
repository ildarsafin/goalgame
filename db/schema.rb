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

ActiveRecord::Schema.define(version: 2017_04_04_160718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :serial, force: :cascade do |t|
    t.integer "coins", default: 0
    t.integer "user_id", null: false
    t.integer "tinkoff_rebill_id"
    t.index ["tinkoff_rebill_id"], name: "index_accounts_on_tinkoff_rebill_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "blog_posts", id: :serial, force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.string "picture", null: false
    t.boolean "approved", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blog_posts_on_user_id"
  end

  create_table "daily_reports", id: :serial, force: :cascade do |t|
    t.text "content", null: false
    t.integer "position"
    t.integer "goal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_daily_reports_on_goal_id"
  end

  create_table "goal_steps", id: :serial, force: :cascade do |t|
    t.text "description"
    t.integer "position"
    t.datetime "done_at"
    t.integer "goal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_goal_steps_on_goal_id"
  end

  create_table "goals", id: :serial, force: :cascade do |t|
    t.text "description", null: false
    t.integer "position"
    t.string "picture"
    t.datetime "start_at", null: false
    t.datetime "planned_achieve_at", null: false
    t.datetime "actually_achieved_at"
    t.datetime "cancelled_at"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.integer "amount_in_kopecks", default: 0
    t.integer "status", default: 0
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "personas", id: :serial, force: :cascade do |t|
    t.integer "cost", null: false
    t.string "name", null: false
    t.text "description"
  end

  create_table "profiles", id: :serial, force: :cascade do |t|
    t.string "full_name", null: false
    t.string "avatar"
    t.integer "activity_points", default: 0
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "user_personas", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "persona_id", null: false
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_user_personas_on_persona_id"
    t.index ["user_id"], name: "index_user_personas_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "administrator", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "blog_posts", "users"
  add_foreign_key "daily_reports", "goals"
  add_foreign_key "goal_steps", "goals"
  add_foreign_key "goals", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "user_personas", "personas"
  add_foreign_key "user_personas", "users"
end
