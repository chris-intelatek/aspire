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

ActiveRecord::Schema.define(version: 20190219041217) do

  create_table "comments", force: :cascade do |t|
    t.text     "hcs_content"
    t.integer  "prospect_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "ap_content"
  end

  add_index "comments", ["prospect_id"], name: "index_comments_on_prospect_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "prospects", force: :cascade do |t|
    t.string   "organization"
    t.string   "street_address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "website"
    t.integer  "employees",                       default: 0
    t.text     "prospect_note"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.date     "hcs_intro_presentation_date"
    t.date     "hcs_sme_presentation_date"
    t.decimal  "hcs_current_health_benefit_cost", default: 0.0,   null: false
    t.string   "hcs_status"
    t.date     "hcs_agreement_date"
    t.integer  "user_id"
    t.date     "hcs_proposal_meeting_date"
    t.string   "contact1_first_name"
    t.string   "contact1_last_name"
    t.string   "contact1_title"
    t.string   "contact1_phone"
    t.string   "contact1_mobile"
    t.string   "contact1_email"
    t.string   "contact2_first_name"
    t.string   "contact2_last_name"
    t.string   "contact2_title"
    t.string   "contact2_phone"
    t.string   "contact2_mobile"
    t.string   "contact2_email"
    t.integer  "primary_contact"
    t.string   "hcs_intro_presenter"
    t.string   "hcs_sme"
    t.string   "hcs_current_carrier"
    t.string   "hcs_current_coverage_type"
    t.string   "hcs_intelatek_bda"
    t.text     "hcs_intelatek_notes"
    t.string   "hcs_intelatek_day"
    t.string   "hcs_intelatek_timezone"
    t.string   "hcs_intelatek_time"
    t.string   "hcs_next_action"
    t.date     "hcs_next_action_date"
    t.date     "cps_intro_presentation_date"
    t.date     "cps_sme_presentation_date"
    t.decimal  "cps_total_ap",                    default: 0.0,   null: false
    t.string   "cps_status"
    t.date     "cps_agreement_date"
    t.date     "cps_supplier_match_meeting_date"
    t.string   "cps_intro_presenter"
    t.string   "cps_sme"
    t.string   "cps_intelatek_bda"
    t.text     "cps_intelatek_notes"
    t.string   "cps_intelatek_day"
    t.string   "cps_intelatek_timezone"
    t.string   "cps_intelatek_time"
    t.decimal  "hcs_new_cost",                    default: 0.0,   null: false
    t.date     "cps_next_action_date"
    t.string   "cps_next_action"
    t.boolean  "hcs_prospect",                    default: false
    t.boolean  "cps_prospect",                    default: false
    t.decimal  "cps_converted_ap",                default: 0.0,   null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "advisor_first_name"
    t.string   "advisor_last_name"
    t.boolean  "admin",                  default: false
    t.boolean  "manager",                default: false
    t.string   "advisor_phone"
    t.string   "advisor_mobile"
    t.boolean  "support",                default: false
    t.string   "group"
    t.string   "gravatar"
    t.boolean  "bc_swat",                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
