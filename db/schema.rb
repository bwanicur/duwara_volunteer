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

ActiveRecord::Schema.define(version: 2020_12_05_015722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_event_type_memberships", force: :cascade do |t|
    t.integer "event_id"
    t.integer "event_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_event_type_memberships_on_event_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "key", null: false
    t.string "display_name", null: false
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_user_memberships", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.string "invite_hash", null: false
    t.string "response"
    t.datetime "last_replied_on"
    t.boolean "attended", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id", "user_id"], name: "event_user_mem_idx", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.integer "event_type_id", null: false
    t.string "title", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "description"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.integer "max_volunteers"
    t.boolean "is_template", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_event_type_memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "event_type_id"], name: "index_user_event_type_memberships_on_user_id_and_event_type_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone"
    t.string "info"
    t.boolean "active", default: true, null: false
    t.boolean "receive_emails", default: true, null: false
    t.string "roles", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
