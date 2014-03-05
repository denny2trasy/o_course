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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121228070210) do

  create_table "chinacaches", :force => true do |t|
    t.string   "name"
    t.string   "show_chinacache_id"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_packages", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.integer  "valid_for"
    t.text     "description"
    t.string   "register_code"
    t.integer  "number_of_users"
    t.boolean  "require_address",     :default => false
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "eleutian_course"
    t.string   "thinkingcap_program"
    t.string   "course_type"
  end

  add_index "course_packages", ["customer_id"], :name => "index_course_packages_on_customer_id"

  create_table "customers", :force => true do |t|
    t.string   "short_name"
    t.string   "company_name"
    t.string   "payment_terms"
    t.string   "billing_currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_groups", :force => true do |t|
    t.integer  "course_package_id"
    t.string   "name"
    t.integer  "position"
    t.integer  "credits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course_type"
    t.integer  "quiz_level"
  end

  create_table "items", :force => true do |t|
    t.integer  "item_group_id"
    t.string   "name"
    t.integer  "lesson_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "content_id"
    t.string   "content_type"
  end

  create_table "register_codes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_package_id"
    t.string   "code"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "valid_time"
    t.text     "desc1"
    t.text     "desc"
  end

  create_table "scenarios", :force => true do |t|
    t.integer  "item_group_id"
    t.string   "name"
    t.integer  "show_scenario_id"
    t.integer  "position"
    t.string   "show_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

  create_table "session_credits", :force => true do |t|
    t.integer  "course_package_id"
    t.string   "session_type"
    t.integer  "quantity"
    t.integer  "session_length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thinkingcaps", :force => true do |t|
    t.string   "name"
    t.string   "show_course_id"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "third_contents", :force => true do |t|
    t.integer  "item_group_id"
    t.string   "name"
    t.string   "show_content_id"
    t.integer  "position"
    t.string   "show_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thinkingcap_course"
  end

end
