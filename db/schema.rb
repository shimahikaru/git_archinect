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

ActiveRecord::Schema.define(version: 2018_09_23_025755) do

  create_table "details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "image"
    t.string "title"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genre_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "product_id", null: false
    t.boolean "genre1"
    t.boolean "genre2"
    t.boolean "genre3"
    t.boolean "genre4"
    t.boolean "genre5"
    t.boolean "genre6"
    t.boolean "genre7"
    t.boolean "genre8"
    t.boolean "genre9"
    t.boolean "genre10"
    t.boolean "genre11"
    t.boolean "genre12"
    t.boolean "genre13"
    t.boolean "genre14"
    t.boolean "genre15"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.string "subtitle"
    t.integer "whet"
    t.date "completion"
    t.integer "location"
    t.string "location2"
    t.float "area"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genre"
  end

  create_table "tag_works", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "work1"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "work2"
    t.boolean "work3"
    t.boolean "work4"
    t.boolean "work5"
    t.boolean "work6"
    t.boolean "work7"
    t.boolean "work8"
    t.boolean "work9"
    t.boolean "work10"
    t.boolean "work11"
    t.boolean "work12"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "familyname", default: "", null: false
    t.string "firstname", default: "", null: false
    t.string "office", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location", null: false
    t.string "phone"
    t.string "address"
    t.string "local"
    t.string "encrypted_password", default: "", null: false
    t.string "work"
    t.boolean "offer"
    t.string "url"
    t.string "avatar"
    t.string "text"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "whole_photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "photo"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
