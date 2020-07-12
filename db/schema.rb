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

ActiveRecord::Schema.define(version: 2020_07_12_215749) do

  create_table "owners", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "fname"
    t.string "lname"
    t.string "street"
    t.string "phone"
    t.string "city"
    t.string "zip"
    t.string "state"
  end

  create_table "pet_pictures", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "picture_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "owner_id"
    t.integer "profile"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "title"
    t.string "filename"
    t.string "caption"
    t.text "description"
  end

end
