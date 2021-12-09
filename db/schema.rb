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

ActiveRecord::Schema.define(version: 2019_05_16_181109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emails", force: :cascade do |t|
    t.string "enderecoemail"
    t.string "observacao"
    t.bigint "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_emails_on_pessoa_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "logradouro"
    t.integer "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "pais"
    t.string "estado"
    t.string "municipio"
    t.string "referencia"
    t.bigint "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_enderecos_on_pessoa_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nomecompletoourazaosocial"
    t.string "nomefantasia"
    t.string "cpfoucnpj"
    t.string "inscricaoestadual"
    t.string "rg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telefones", force: :cascade do |t|
    t.string "numero"
    t.string "tipo"
    t.string "contato"
    t.bigint "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_telefones_on_pessoa_id"
  end

  add_foreign_key "emails", "pessoas"
  add_foreign_key "enderecos", "pessoas"
  add_foreign_key "telefones", "pessoas"
end
