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

ActiveRecord::Schema.define(version: 20_201_112_113_013) do
  create_table 'adverts', force: :cascade do |t|
    t.string 'picture_file_name'
    t.string 'picture_content_type'
    t.bigint 'picture_file_size'
    t.datetime 'picture_updated_at'
    t.string 'text'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_adverts_on_user_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'text', null: false
    t.integer 'user_id'
    t.integer 'advert_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['advert_id'], name: 'index_comments_on_advert_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'responses', force: :cascade do |t|
    t.string 'status', null: false
    t.integer 'user_id'
    t.integer 'advert_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['advert_id'], name: 'index_responses_on_advert_id'
    t.index ['user_id'], name: 'index_responses_on_user_id'
  end

  create_table 'taggings', force: :cascade do |t|
    t.integer 'tag_id'
    t.string 'taggable_type'
    t.integer 'taggable_id'
    t.string 'tagger_type'
    t.integer 'tagger_id'
    t.string 'context', limit: 128
    t.datetime 'created_at'
    t.index ['context'], name: 'index_taggings_on_context'
    t.index %w[tag_id taggable_id taggable_type context tagger_id tagger_type], name: 'taggings_idx', unique: true
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
    t.index %w[taggable_id taggable_type context], name: 'taggings_taggable_context_idx'
    t.index %w[taggable_id taggable_type tagger_id context], name: 'taggings_idy'
    t.index ['taggable_id'], name: 'index_taggings_on_taggable_id'
    t.index ['taggable_type'], name: 'index_taggings_on_taggable_type'
    t.index %w[tagger_id tagger_type], name: 'index_taggings_on_tagger_id_and_tagger_type'
    t.index ['tagger_id'], name: 'index_taggings_on_tagger_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'taggings_count', default: 0
    t.index ['name'], name: 'index_tags_on_name', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'encrypted_password', null: false
    t.string 'login', null: false
    t.string 'full_name', null: false
    t.datetime 'birthday', null: false
    t.string 'address', null: false
    t.string 'city', null: false
    t.string 'state', null: false
    t.string 'country', null: false
    t.integer 'zip', null: false
    t.string 'role', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'taggings', 'tags'
end
