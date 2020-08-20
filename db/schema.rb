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

ActiveRecord::Schema.define(version: 2020_08_19_132040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_volunteer_memberships", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "volunteer_id", null: false
    t.string "invite_hash", null: false
    t.boolean "response"
    t.datetime "last_replied_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id", "volunteer_id"], name: "event_volunteer_mem_idx", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.datetime "start_time", null: false
    t.datetime "end_time"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone"
    t.string "info"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_volunteers_on_email", unique: true
  end

end
