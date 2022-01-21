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

ActiveRecord::Schema.define(version: 2022_01_20_232312) do

  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exchange_id"
    t.integer "coin_id"
    t.float "coin_quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coin_id"], name: "index_accounts_on_coin_id"
    t.index ["exchange_id"], name: "index_accounts_on_exchange_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "coins", force: :cascade do |t|
    t.string "name"
    t.string "ticker"
    t.float "price", default: 0.0
    t.string "asset_id"
    t.integer "marketcap_rank"
    t.integer "total_supply"
    t.float "total_marketcap"
    t.datetime "last_updated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "exchanges", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
