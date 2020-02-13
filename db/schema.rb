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

ActiveRecord::Schema.define(version: 20200213000731) do

  create_table "appointments", force: :cascade do |t|
    t.integer "client_id"
    t.integer "trainer_id"
    t.date    "date"
    t.time    "time"
    t.string  "specialty"
    t.string  "trainer_name"
    t.string  "client_name"
    t.index ["client_id"], name: "index_appointments_on_client_id"
    t.index ["trainer_id"], name: "index_appointments_on_trainer_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "specialty"
  end

end