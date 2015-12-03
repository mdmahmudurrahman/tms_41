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

ActiveRecord::Schema.define(version: 20151203104936) do

  create_table "activities", force: :cascade do |t|
    t.string   "activity_type",  limit: 255
    t.integer  "user_id",        limit: 4
    t.integer  "target_id",      limit: 4
    t.integer  "course_id",      limit: 4
    t.integer  "subject_id",     limit: 4
    t.integer  "task_id",        limit: 4
    t.string   "action_message", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "course_subjects", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "subject_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id", using: :btree
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_open"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "current_course_subject_tasks", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "subject_id", limit: 4
    t.integer  "task_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "current_course_subject_tasks", ["course_id"], name: "index_current_course_subject_tasks_on_course_id", using: :btree
  add_index "current_course_subject_tasks", ["subject_id"], name: "index_current_course_subject_tasks_on_subject_id", using: :btree
  add_index "current_course_subject_tasks", ["task_id"], name: "index_current_course_subject_tasks_on_task_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.date     "todays_date"
    t.text     "todays_task",    limit: 65535
    t.text     "tomorrows_task", limit: 65535
    t.text     "free_comment",   limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "subject_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tasks", ["subject_id"], name: "index_tasks_on_subject_id", using: :btree

  create_table "user_completed_tasks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "task_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_completed_tasks", ["task_id"], name: "index_user_completed_tasks_on_task_id", using: :btree
  add_index "user_completed_tasks", ["user_id"], name: "index_user_completed_tasks_on_user_id", using: :btree

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "course_id",    limit: 4
    t.datetime "deadline"
    t.boolean  "is_completed"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_courses", ["course_id"], name: "index_user_courses_on_course_id", using: :btree
  add_index "user_courses", ["user_id"], name: "index_user_courses_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "email",                  limit: 255
    t.string   "password_digest",        limit: 255
    t.string   "remember_digest",        limit: 255
    t.string   "role",                   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "activities", "users"
  add_foreign_key "course_subjects", "courses"
  add_foreign_key "course_subjects", "subjects"
  add_foreign_key "current_course_subject_tasks", "courses"
  add_foreign_key "current_course_subject_tasks", "subjects"
  add_foreign_key "current_course_subject_tasks", "tasks"
  add_foreign_key "reports", "users"
  add_foreign_key "tasks", "subjects"
  add_foreign_key "user_completed_tasks", "tasks"
  add_foreign_key "user_completed_tasks", "users"
  add_foreign_key "user_courses", "courses"
  add_foreign_key "user_courses", "users"
end
