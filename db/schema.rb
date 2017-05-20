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

ActiveRecord::Schema.define(version: 20160408163808) do

  create_table "assists", force: :cascade do |t|
    t.boolean  "assist",          default: false
    t.integer  "student_id"
    t.integer  "course_class_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "assists", ["course_class_id"], name: "index_assists_on_course_class_id"
  add_index "assists", ["student_id"], name: "index_assists_on_student_id"

  create_table "classdays", force: :cascade do |t|
    t.string   "day"
    t.time     "begin_time"
    t.time     "end_time"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "classdays", ["group_id"], name: "index_classdays_on_group_id"

  create_table "course_classes", force: :cascade do |t|
    t.date     "date"
    t.boolean  "active",      default: true
    t.integer  "classday_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "course_classes", ["classday_id"], name: "index_course_classes_on_classday_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "retardment", default: 0
    t.time     "time_limit"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "subject"
    t.date     "begin_date"
    t.date     "end_date"
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id"

  create_table "groups_students", force: :cascade do |t|
    t.integer "group_id"
    t.integer "student_id"
  end

  add_index "groups_students", ["group_id"], name: "index_groups_students_on_group_id"
  add_index "groups_students", ["student_id"], name: "index_groups_students_on_student_id"

  create_table "students", force: :cascade do |t|
    t.string   "account_number"
    t.string   "last_name"
    t.string   "maiden_name"
    t.string   "first_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "last_name"
    t.string   "maiden_name"
    t.string   "first_name"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

end
