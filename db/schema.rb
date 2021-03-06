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

ActiveRecord::Schema.define(version: 20140902224826) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "open",       default: false
    t.string   "slug"
  end

  add_index "brands", ["slug"], name: "index_brands_on_slug", unique: true

  create_table "colors", force: true do |t|
    t.string   "hex"
    t.string   "name"
    t.boolean  "primary"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colors", ["brand_id"], name: "index_colors_on_brand_id"

  create_table "copies", force: true do |t|
    t.string   "description"
    t.text     "text"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "copies", ["brand_id"], name: "index_copies_on_brand_id"

  create_table "fonts", force: true do |t|
    t.string   "name"
    t.string   "font_family"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fonts", ["brand_id"], name: "index_fonts_on_brand_id"

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "guidelines", force: true do |t|
    t.string   "description"
    t.string   "text"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guidelines", ["brand_id"], name: "index_guidelines_on_brand_id"

  create_table "logos", force: true do |t|
    t.string   "path"
    t.boolean  "permission"
    t.string   "description"
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logos", ["brand_id"], name: "index_logos_on_brand_id"

  create_table "misc_assets", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "thumbnail"
    t.boolean  "permissions"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "misc_assets", ["brand_id"], name: "index_misc_assets_on_brand_id"

  create_table "pdfs", force: true do |t|
    t.integer "brand_id"
    t.string  "kind"
    t.string  "primary_color"
    t.string  "secondary_color"
    t.string  "logo"
    t.string  "font"
    t.boolean "border"
    t.string  "street_number"
    t.string  "street_address"
    t.string  "city"
    t.string  "post_code"
    t.string  "number"
  end

  create_table "user_brands", force: true do |t|
    t.integer  "user_id"
    t.integer  "brand_id"
    t.integer  "permission"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_brands", ["brand_id"], name: "index_user_brands_on_brand_id"
  add_index "user_brands", ["user_id"], name: "index_user_brands_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "surname"
  end

end
