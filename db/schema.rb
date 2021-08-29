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

ActiveRecord::Schema.define(version: 2021_08_29_053700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lesson_reservations", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_lesson_reservations_on_lesson_id"
    t.index ["student_id", "lesson_id"], name: "index_lesson_reservations_on_student_id_and_lesson_id", unique: true
  end

  create_table "lessons", force: :cascade do |t|
    t.datetime "started_at", null: false
    t.text "content", default: "", null: false
    t.text "zoom_url", default: "https://zoom.us/jp-jp/meetings.html", null: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
  end

  create_table "monthly_plans", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "ticket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "ticket_id"], name: "index_monthly_plans_on_name_and_ticket_id", unique: true
    t.index ["ticket_id"], name: "index_monthly_plans_on_ticket_id"
  end

  create_table "purchase_tickets", force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.bigint "student_id", null: false
    t.date "deadline", default: "3021-08-29", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_purchase_tickets_on_student_id"
    t.index ["ticket_id"], name: "index_purchase_tickets_on_ticket_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.text "profile", default: "", null: false
    t.text "image"
    t.bigint "language_id", null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["language_id"], name: "index_teachers_on_language_id"
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "fee", null: false
    t.integer "lesson_count", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "lesson_reservations", "lessons"
  add_foreign_key "lesson_reservations", "students"
  add_foreign_key "lessons", "teachers"
  add_foreign_key "monthly_plans", "tickets"
  add_foreign_key "purchase_tickets", "students"
  add_foreign_key "purchase_tickets", "tickets"
  add_foreign_key "teachers", "languages"
end
