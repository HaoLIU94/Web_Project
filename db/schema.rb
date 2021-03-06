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

ActiveRecord::Schema.define(version: 20170525180338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exams", force: :cascade do |t|
    t.string   "name"
    t.string   "prof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "subject_id"
    t.date     "date"
    t.index ["subject_id"], name: "index_exams_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_exams_on_user_id", using: :btree
  end

  create_table "scores", force: :cascade do |t|
    t.string   "student"
    t.string   "exam"
    t.integer  "result"
    t.string   "prof"
    t.text     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "exam_id"
    t.index ["exam_id"], name: "index_scores_on_exam_id", using: :btree
    t.index ["user_id"], name: "index_scores_on_user_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "prof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.date     "begin"
    t.date     "end"
    t.index ["user_id"], name: "index_subjects_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "prof",                   default: false
    t.boolean  "student",                default: true
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.boolean  "approved",               default: false, null: false
    t.index ["approved"], name: "index_users_on_approved", using: :btree
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "exams", "subjects"
  add_foreign_key "exams", "users"
  add_foreign_key "scores", "exams"
  add_foreign_key "scores", "users"
  add_foreign_key "subjects", "users"
end
