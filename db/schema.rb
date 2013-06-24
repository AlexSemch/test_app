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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130624111134) do

  create_table "danswers", :force => true do |t|
    t.integer  "dquestion_id"
    t.text     "answer_text"
    t.boolean  "ans_is_true",  :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "danswers", ["dquestion_id"], :name => "index_danswers_on_dquestion_id"

  create_table "dquestions", :force => true do |t|
    t.text     "question_text"
    t.integer  "count_answer",  :default => 4
    t.string   "dtest_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "dquestions", ["dtest_id"], :name => "index_dquestions_on_dtest_id"

  create_table "dtests", :force => true do |t|
    t.text     "test_name"
    t.integer  "count_test", :default => 20
    t.integer  "time_exec",  :default => 20
    t.text     "test_descr"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "dtests", ["test_name"], :name => "index_dtests_on_test_name"

  create_table "janswers", :force => true do |t|
    t.integer  "jquestion_id"
    t.integer  "danswer_id"
    t.boolean  "truanswer",    :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "jquestions", :force => true do |t|
    t.integer  "jtest_id"
    t.integer  "dquestion_id"
    t.boolean  "truanswer",    :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "jtests", :force => true do |t|
    t.integer  "dtest_id"
    t.integer  "student_id"
    t.time     "begin_time"
    t.time     "end_time"
    t.float    "ball"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "jtests", ["student_id"], :name => "index_jtests_on_student_id"

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "students", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "name"
    t.string   "second_name"
    t.date     "birth_date"
    t.integer  "class_st"
    t.boolean  "is_teacher",    :default => false
    t.integer  "count_of_test"
    t.float    "round_ball"
    t.text     "descr_st"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "students", ["count_of_test", "round_ball"], :name => "index_students_on_count_of_test_and_round_ball"
  add_index "students", ["first_name"], :name => "index_students_on_first_name"
  add_index "students", ["name"], :name => "index_students_on_name"
  add_index "students", ["round_ball"], :name => "index_students_on_round_ball"
  add_index "students", ["second_name"], :name => "index_students_on_second_name"
  add_index "students", ["user_id"], :name => "index_students_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "nik"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
