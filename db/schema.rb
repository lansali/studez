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

ActiveRecord::Schema.define(version: 2019_11_27_134205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.bigint "employer_id", null: false
    t.string "logo"
    t.text "description"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employer_id"], name: "index_businesses_on_employer_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.text "comment"
    t.decimal "flagged"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "employers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_employers_on_user_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "name"
    t.bigint "business_id", null: false
    t.text "description"
    t.string "location"
    t.text "requirements"
    t.text "other"
    t.date "deadline"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_opportunities_on_business_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.bigint "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.string "profile_picture"
    t.string "full_name"
    t.string "tagline"
    t.string "phone_number"
    t.string "physical_address"
    t.string "email_adress"
    t.string "work_experience"
    t.string "education"
    t.string "certifications"
    t.string "skills"
    t.string "languages"
    t.string "past_projects"
    t.string "workshops"
    t.string "volunteerships"
    t.string "relevant_links"
    t.string "extra_columns"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_resumes_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "institution_name"
    t.text "bio"
    t.string "course_name"
    t.date "year_started_course"
    t.date "expected_graduation_year"
    t.text "interests"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "opportunity_id", null: false
    t.bigint "student_id", null: false
    t.text "cover_letter"
    t.bigint "resume_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["opportunity_id"], name: "index_submissions_on_opportunity_id"
    t.index ["resume_id"], name: "index_submissions_on_resume_id"
    t.index ["student_id"], name: "index_submissions_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.boolean "admin"
    t.boolean "moderator"
    t.boolean "employer"
    t.boolean "student"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email", "username"], name: "index_users_on_email_and_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "businesses", "employers"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "employers", "users"
  add_foreign_key "opportunities", "businesses"
  add_foreign_key "posts", "users", column: "author_id"
  add_foreign_key "resumes", "students"
  add_foreign_key "students", "users"
  add_foreign_key "submissions", "opportunities"
  add_foreign_key "submissions", "resumes"
  add_foreign_key "submissions", "students"
end
