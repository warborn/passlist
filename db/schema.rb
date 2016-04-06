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

ActiveRecord::Schema.define(version: 20160406135707) do

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
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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

end
