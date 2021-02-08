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

ActiveRecord::Schema.define(version: 2021_02_08_085939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "requests", force: :cascade do |t|
    t.string "bk_organization_id"
    t.string "source_uuid"
    t.integer "transactions_summerized_count"
    t.float "summarized_net_sales"
    t.string "journal_entry_template"
    t.text "json_diff"
    t.string "connection_id"
    t.string "short_summary"
    t.string "source_raw_data"
    t.string "apify_run_url"
    t.integer "bk_external_id"
    t.jsonb "post_raw_data"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
