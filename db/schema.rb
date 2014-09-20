# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140920163612) do

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "games", force: true do |t|
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.integer  "status"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["user1_id"], name: "index_games_on_user1_id"
  add_index "games", ["user2_id"], name: "index_games_on_user2_id"
  add_index "games", ["word_id"], name: "index_games_on_word_id"

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "moves", force: true do |t|
    t.string   "char"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "moves", ["game_id"], name: "index_moves_on_game_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wins"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "words", force: true do |t|
    t.string  "word"
    t.integer "category_id"
  end

  add_index "words", ["category_id"], name: "index_words_on_category_id"

end
