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

ActiveRecord::Schema.define(version: 2018_11_03_222342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendamentos", force: :cascade do |t|
    t.datetime "data"
    t.bigint "local_id"
    t.bigint "especialidade_id"
    t.bigint "medico_id"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["especialidade_id"], name: "index_agendamentos_on_especialidade_id"
    t.index ["local_id"], name: "index_agendamentos_on_local_id"
    t.index ["medico_id"], name: "index_agendamentos_on_medico_id"
    t.index ["usuario_id"], name: "index_agendamentos_on_usuario_id"
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.bigint "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
  end

  create_table "especialidades", force: :cascade do |t|
    t.string "Nome"
    t.string "Descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ativo"
  end

  create_table "especialidades_medicos", id: false, force: :cascade do |t|
    t.bigint "medico_id", null: false
    t.bigint "especialidade_id", null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string "sigla"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locais", force: :cascade do |t|
    t.string "nome"
    t.string "cep"
    t.string "rua"
    t.string "numero"
    t.integer "cidade_id"
    t.string "bairro"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ativo"
  end

  create_table "medicos", force: :cascade do |t|
    t.string "nome"
    t.string "crm"
    t.string "local"
    t.string "telefone"
    t.string "celular"
    t.string "email"
    t.string "sexo"
    t.string "situacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "numerosus"
    t.string "cpf"
    t.date "dtanasc"
    t.string "telfixo"
    t.string "telcel"
    t.string "sexo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "agendamentos", "especialidades"
  add_foreign_key "agendamentos", "locais"
  add_foreign_key "agendamentos", "medicos"
  add_foreign_key "agendamentos", "usuarios"
  add_foreign_key "cidades", "estados"
end
