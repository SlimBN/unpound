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

ActiveRecord::Schema.define(:version => 20131103121758) do

  create_table "administrations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "lang_id"
    t.string   "slug"
    t.integer  "user_id"
    t.string   "photo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "tag_list"
    t.integer  "country_id"
    t.string   "town"
    t.integer  "folder_id"
  end

  create_table "articles_and_pages", :force => true do |t|
    t.integer  "article_id"
    t.integer  "journal_id"
    t.integer  "page_id"
    t.integer  "user_id"
    t.string   "style"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "number_of_repush"
    t.integer  "number_of_article_repush"
  end

  create_table "articles_tags", :force => true do |t|
    t.integer "article_id"
    t.integer "tag_id"
  end

  add_index "articles_tags", ["article_id"], :name => "index_articles_tags_on_article_id"
  add_index "articles_tags", ["tag_id"], :name => "index_articles_tags_on_tag_id"

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.string   "shot"
    t.string   "slug"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "credits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.string   "verdict"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "board_id"
    t.integer  "journal_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "folders", :force => true do |t|
    t.string   "name"
    t.string   "skin"
    t.text     "description"
    t.string   "kind"
    t.integer  "user_id"
    t.boolean  "hidden"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "follows", :force => true do |t|
    t.integer  "user_id"
    t.integer  "followee_id"
    t.integer  "journal_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "homes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "issues", :force => true do |t|
    t.integer  "journal_id"
    t.string   "theme"
    t.integer  "number"
    t.string   "picture"
    t.boolean  "draft"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "journals", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slug"
    t.string   "logo"
    t.string   "cover"
    t.integer  "user_id"
    t.integer  "country_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "style"
  end

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "issue_id"
    t.boolean  "seen"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.integer  "issue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "classement"
  end

  create_table "publications", :force => true do |t|
    t.integer  "article_id"
    t.integer  "journal_id"
    t.integer  "user_id"
    t.string   "element"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reads", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "journal_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "issue_id"
    t.integer  "page_id"
    t.integer  "publication_id"
  end

  create_table "soons", :force => true do |t|
    t.text     "mail",       :null => false
    t.text     "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "soons", ["mail"], :name => "sqlite_autoindex_soons_1", :unique => true

  create_table "sqlite_sp_functions", :id => false, :force => true do |t|
    t.text "name"
    t.text "text"
  end

# Could not dump table "sqlite_stat1" because of following StandardError
#   Unknown type '' for column 'tbl'

# Could not dump table "sqlite_stat3" because of following StandardError
#   Unknown type '' for column 'tbl'

  create_table "sqlite_vs_links_names", :id => false, :force => true do |t|
    t.text "name"
    t.text "alias"
  end

  create_table "sqlite_vs_properties", :id => false, :force => true do |t|
    t.text "parentType"
    t.text "parentName"
    t.text "propertyName"
    t.text "propertyValue"
  end

  create_table "tags", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["content"], :name => "index_tags_on_content", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username"
    t.text     "about"
    t.integer  "country_id"
    t.string   "town"
    t.string   "avatar"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false
    t.text     "slug"
    t.text     "background"
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_slug"

  create_table "visits", :force => true do |t|
    t.string   "what"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "element_id"
    t.integer  "user_id"
  end

end
