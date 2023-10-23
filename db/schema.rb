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

ActiveRecord::Schema[7.0].define(version: 2023_10_20_091718) do
  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.integer "pincode"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "applied_jobs", force: :cascade do |t|
    t.integer "status"
    t.integer "user_id"
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_applied_jobs_on_job_id"
    t.index ["user_id"], name: "index_applied_jobs_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "course_name"
    t.string "institution_name"
    t.date "year_of_passing"
    t.integer "grade"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "role"
    t.string "company_name"
    t.integer "year_of_exp"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.integer "job_type"
    t.integer "no_of_vac"
    t.integer "pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "company_name"
    t.string "location"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "skillable_type"
    t.integer "skillable_id"
    t.string "name"
    t.index ["skillable_type", "skillable_id"], name: "index_skills_on_skillable"
  end

  create_table "temps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.integer "phone_no"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_skills_id"
    t.integer "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_skills_id"], name: "index_users_on_user_skills_id"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "applied_jobs", "jobs"
  add_foreign_key "applied_jobs", "users"
  add_foreign_key "educations", "users"
  add_foreign_key "experiences", "users"
end
