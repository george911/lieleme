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

ActiveRecord::Schema.define(version: 20151013083604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bosses", force: :cascade do |t|
    t.string   "title"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bosses", ["job_id"], name: "index_bosses_on_job_id", using: :btree

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "employer"
    t.string   "mobile"
    t.string   "email"
    t.string   "city"
    t.string   "note"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "age"
    t.integer  "follwers"
    t.integer  "year"
  end

  add_index "candidates", ["user_id"], name: "index_candidates_on_user_id", using: :btree

  create_table "client_emails", force: :cascade do |t|
    t.string   "email"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "client_emails", ["client_id"], name: "index_client_emails_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "industry"
    t.text     "note"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.string   "author"
    t.boolean  "top"
    t.integer  "job_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["job_id"], name: "index_comments_on_job_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "educations", force: :cascade do |t|
    t.string   "school"
    t.date     "enter_school"
    t.date     "leave_school"
    t.string   "major"
    t.string   "degree"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "uptonow"
  end

  add_index "educations", ["user_id"], name: "index_educations_on_user_id", using: :btree

  create_table "emails", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "skill"
    t.string   "city"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "skill"
    t.integer  "year"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["job_id"], name: "index_experiences_on_job_id", using: :btree

  create_table "hrs", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "email"
    t.string   "phone"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hrs", ["client_id"], name: "index_hrs_on_client_id", using: :btree

  create_table "inquiries", force: :cascade do |t|
    t.string   "name"
    t.string   "employer"
    t.string   "title"
    t.string   "mobile"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "inquiry_type"
  end

  create_table "interviews", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.integer  "job_id"
    t.boolean  "accept"
    t.string   "address"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "feedback"
    t.datetime "datetime"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "accept"
    t.string   "job_title"
    t.string   "job_employer"
    t.string   "status",       default: "active"
  end

  create_table "job_rates", force: :cascade do |t|
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_rates", ["job_id"], name: "index_job_rates_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "addr"
    t.string   "city"
    t.string   "industry"
    t.integer  "commission"
    t.text     "role"
    t.text     "requirement"
    t.integer  "base_pay"
    t.integer  "month"
    t.string   "bonus"
    t.integer  "allowance"
    t.string   "stock"
    t.integer  "stock_num"
    t.date     "concall_date"
    t.string   "peer"
    t.text     "memo"
    t.text     "company_info"
    t.integer  "work_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employer"
    t.string   "status",              default: "active"
    t.integer  "poster_id"
    t.boolean  "interview"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "line_items", force: :cascade do |t|
    t.string   "mobile"
    t.string   "email"
    t.string   "name"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
    t.text     "feedback"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "interviewed"
  end

  add_index "line_items", ["job_id"], name: "index_line_items_on_job_id", using: :btree
  add_index "line_items", ["user_id"], name: "index_line_items_on_user_id", using: :btree

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
    t.string   "title"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "read_marks", force: :cascade do |t|
    t.integer  "readable_id"
    t.string   "readable_type", null: false
    t.integer  "user_id",       null: false
    t.datetime "timestamp"
  end

  add_index "read_marks", ["user_id", "readable_type", "readable_id"], name: "index_read_marks_on_user_id_and_readable_type_and_readable_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "author"
    t.integer  "author_id"
    t.boolean  "top"
    t.text     "body"
    t.integer  "rating"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employer"
    t.string   "title"
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "saving_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "saving_lists", ["user_id", "job_id"], name: "index_saving_lists_on_user_id_and_job_id", unique: true, using: :btree

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_rates", force: :cascade do |t|
    t.integer  "line_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_rates", ["line_item_id"], name: "index_service_rates_on_line_item_id", using: :btree

  create_table "subordinates", force: :cascade do |t|
    t.string   "title"
    t.integer  "num"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subordinates", ["job_id"], name: "index_subordinates_on_job_id", using: :btree

  create_table "summaries", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "summaries", ["user_id"], name: "index_summaries_on_user_id", using: :btree

  create_table "talent_pools", force: :cascade do |t|
    t.integer  "hunter_id"
    t.integer  "talent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "talent_pools", ["hunter_id"], name: "index_talent_pools_on_hunter_id", using: :btree
  add_index "talent_pools", ["talent_id", "hunter_id"], name: "index_talent_pools_on_talent_id_and_hunter_id", unique: true, using: :btree
  add_index "talent_pools", ["talent_id"], name: "index_talent_pools_on_talent_id", using: :btree

  create_table "targets", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "department"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "targets", ["job_id"], name: "index_targets_on_job_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "mobile"
    t.string   "user_name"
    t.string   "true_name"
    t.string   "user_type"
    t.integer  "base_salary"
    t.integer  "month_num"
    t.integer  "bonus"
    t.integer  "housing"
    t.integer  "transport"
    t.string   "stock"
    t.integer  "stock_num"
    t.integer  "retention_bonus"
    t.integer  "expect_package"
    t.integer  "expect_month_salary"
    t.date     "birthday"
    t.string   "city"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "industry"
    t.string   "focus_job1"
    t.string   "focus_job2"
    t.string   "focus_job3"
    t.integer  "bank_id"
    t.string   "verify"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  create_table "works", force: :cascade do |t|
    t.string   "title"
    t.string   "employer"
    t.string   "industry"
    t.date     "join_date"
    t.date     "leave_date"
    t.text     "job_scope"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "uptonow"
  end

  add_index "works", ["user_id"], name: "index_works_on_user_id", using: :btree

  add_foreign_key "candidates", "users"
  add_foreign_key "client_emails", "clients"
  add_foreign_key "hrs", "clients"
  add_foreign_key "microposts", "users"
  add_foreign_key "targets", "jobs"
end
