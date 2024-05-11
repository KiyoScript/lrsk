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

ActiveRecord::Schema[7.1].define(version: 2024_05_11_092641) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "consults", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.text "reason"
    t.text "s"
    t.text "rr"
    t.text "o"
    t.text "a"
    t.text "p"
    t.integer "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_consults_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.date "birthdate"
    t.integer "age"
    t.integer "gender"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "length"
    t.float "body_circumference"
    t.float "muac"
    t.float "head_circumference"
    t.float "hip"
    t.float "limbs"
    t.string "z_score"
    t.string "address_line"
    t.string "contact_number"
    t.string "firstname"
    t.string "middle_initial"
    t.string "lastname"
    t.float "weight"
    t.float "height"
    t.float "bmi"
    t.float "temperature"
    t.string "blood_pressure"
    t.string "spo_2"
    t.integer "heart_rate"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "physical_examinations", force: :cascade do |t|
    t.boolean "right_eye"
    t.boolean "left_eye"
    t.boolean "both_eyes"
    t.string "heent"
    t.string "neck"
    t.string "chest_lungs"
    t.string "heart"
    t.string "breast"
    t.string "abdomen"
    t.string "gut"
    t.string "extremities"
    t.string "musculoskeletal"
    t.string "neurological"
    t.string "skin"
    t.text "others"
    t.string "complete_blood_count"
    t.string "urinalysis"
    t.string "fecalysis"
    t.string "chest_xray"
    t.string "fasting_blood_sugar"
    t.string "lipid_profile"
    t.string "blood_uric_acid"
    t.string "ecg_12_leads"
    t.string "drug_test"
    t.string "sputum_genexpert"
    t.string "hbsag"
    t.text "others_1"
    t.text "diagnosis"
    t.text "plan"
    t.string "district_physician"
    t.date "date"
    t.integer "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_physical_examinations_on_patient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.integer "gender", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "consults", "patients"
  add_foreign_key "patients", "users"
  add_foreign_key "physical_examinations", "patients"
end
