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

ActiveRecord::Schema.define(version: 2021_04_10_144229) do

  create_table "estimates", force: :cascade do |t|
    t.float "labor_hours"
    t.float "rate"
    t.float "material_cost"
    t.integer "job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.boolean "behr_premium"
    t.integer "user_id"
    t.date "date"
    t.time "time"
  end

  create_table "rooms", force: :cascade do |t|
    t.float "length"
    t.float "width"
    t.float "height"
    t.integer "job_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "password_digest"
  end

end
