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

ActiveRecord::Schema[7.0].define(version: 2023_07_24_025300) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cfccomments", force: :cascade do |t|
    t.string "content"
    t.bigint "cfcuser_id"
    t.bigint "cfcpost_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cfcpost_id"], name: "index_cfccomments_on_cfcpost_id"
    t.index ["cfcuser_id"], name: "index_cfccomments_on_cfcuser_id"
  end

  create_table "cfcposts", force: :cascade do |t|
    t.string "image"
    t.string "description"
    t.bigint "cfcuser_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cfcuser_id"], name: "index_cfcposts_on_cfcuser_id"
  end

  create_table "cfcreactions", force: :cascade do |t|
    t.string "kind"
    t.bigint "cfcuser_id", null: false
    t.bigint "cfcpost_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cfcpost_id"], name: "index_cfcreactions_on_cfcpost_id"
    t.index ["cfcuser_id"], name: "index_cfcreactions_on_cfcuser_id"
  end

  create_table "cfcusers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_cfcusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_cfcusers_on_reset_password_token", unique: true
  end

  add_foreign_key "cfccomments", "cfcposts"
  add_foreign_key "cfccomments", "cfcusers"
  add_foreign_key "cfcposts", "cfcusers"
  add_foreign_key "cfcreactions", "cfcposts"
  add_foreign_key "cfcreactions", "cfcusers"
end
