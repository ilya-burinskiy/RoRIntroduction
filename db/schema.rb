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

ActiveRecord::Schema.define(version: 2021_01_26_185627) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "body", null: false
    t.boolean "correct", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body", "question_id"], name: "index_answers_on_body_and_question_id", unique: true
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "rule", null: false
    t.integer "rule_property", null: false
    t.index ["name"], name: "index_badges_on_name", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gists", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "url", null: false
    t.string "hash_from_url", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_gists_on_question_id"
    t.index ["user_id"], name: "index_gists_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "body", null: false
    t.integer "test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body", "test_id"], name: "index_questions_on_body_and_test_id", unique: true
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "test_passages", force: :cascade do |t|
    t.integer "test_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "correct_questions", default: 0
    t.integer "question_id"
    t.boolean "passed", default: false
    t.index ["question_id"], name: "index_test_passages_on_question_id"
    t.index ["test_id"], name: "index_test_passages_on_test_id"
    t.index ["user_id"], name: "index_test_passages_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "level", default: 0, null: false
    t.integer "category_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "time", default: 15
    t.index ["category_id"], name: "index_tests_on_category_id"
    t.index ["level", "title"], name: "index_tests_on_level_and_title", unique: true
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "user_badges", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "badge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["badge_id"], name: "index_user_badges_on_badge_id"
    t.index ["user_id"], name: "index_user_badges_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "type", default: "User", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["type"], name: "index_users_on_type"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "gists", "questions"
  add_foreign_key "gists", "users"
  add_foreign_key "questions", "tests"
  add_foreign_key "test_passages", "questions"
  add_foreign_key "test_passages", "tests"
  add_foreign_key "test_passages", "users"
  add_foreign_key "tests", "categories"
  add_foreign_key "tests", "users"
  add_foreign_key "user_badges", "badges"
  add_foreign_key "user_badges", "users"
end
