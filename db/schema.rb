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

ActiveRecord::Schema.define(version: 20170512014140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "gestion_atenciones", force: :cascade do |t|
    t.string   "estado"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "usuario_id"
    t.integer  "ingeniero_id"
  end

  create_table "gestion_auditorias", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "registro_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "remember_token"
    t.integer  "tipo_auditoria_id"
  end

  create_table "gestion_criterios", force: :cascade do |t|
    t.string   "type"
    t.string   "numeral"
    t.string   "texto"
    t.boolean  "directriz"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "tipo_auditoria_id"
  end

  create_table "gestion_eventos", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.datetime "fecha"
    t.string   "email"
    t.string   "direccion"
    t.string   "coordenadas"
    t.string   "type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "fono"
    t.integer  "usuario_id"
    t.integer  "ingeniero_id"
    t.integer  "atencion_id"
  end

  create_table "gestion_evidencias", force: :cascade do |t|
    t.integer  "auditoria_id"
    t.integer  "criterio_id"
    t.integer  "usuario_id"
    t.string   "imagen_uid"
    t.string   "imagen_name"
    t.string   "tipo_contenido"
    t.string   "nombre_archivo"
    t.binary   "bits"
    t.binary   "thumbnail"
    t.string   "tempfile"
    t.string   "descripcion"
    t.string   "lugar"
    t.integer  "estado"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.binary   "imagen"
  end

  create_table "gestion_registros", force: :cascade do |t|
    t.string   "region"
    t.decimal  "rut"
    t.string   "dv"
    t.string   "razon_social"
    t.string   "nombre_fantasia"
    t.string   "direccion"
    t.string   "comuna"
    t.string   "fono"
    t.string   "comportamiento"
    t.string   "email"
    t.string   "email_secundario"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "presentacion"
    t.integer  "auditoria"
  end

  create_table "gestion_tipo_auditorias", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "autor_id"
  end

  create_table "gestion_usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "login"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "imagen_uid"
    t.string   "imagen_name"
    t.string   "tipo_contenido"
    t.string   "nombre_archivo"
    t.binary   "bits"
    t.binary   "thumbnail"
    t.string   "tempfile"
    t.binary   "imagen"
    t.boolean  "activo"
    t.integer  "user_id"
    t.string   "estado"
    t.index ["email"], name: "index_gestion_usuarios_on_email", unique: true, using: :btree
  end

  create_table "presupuesto_fotos", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "tipo_contenido"
    t.string   "nombre_archivo"
    t.binary   "bits"
    t.binary   "thumbnail"
    t.string   "tempfile"
    t.string   "image_uid"
    t.string   "image_name"
    t.integer  "fotolizable_id"
    t.string   "fotolizable_type"
    t.integer  "cv_id"
    t.integer  "presupuesto_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.boolean  "auditor"
    t.integer  "role"
    t.string   "name"
    t.boolean  "ingeniero"
    t.integer  "fono"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "member"
    t.boolean  "client"
    t.boolean  "alumno"
    t.boolean  "profesor"
    t.integer  "presupuesto_id"
    t.string   "direccion"
    t.string   "sintoma"
    t.string   "image_uid"
    t.string   "image_name"
    t.boolean  "email_malo"
    t.boolean  "instalador"
    t.integer  "rut"
    t.string   "rut_string"
    t.integer  "pago_id"
    t.boolean  "paye"
    t.string   "google_url"
    t.boolean  "visitante"
    t.string   "estado"
    t.string   "type"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "gestion_auditorias", "gestion_registros", column: "registro_id"
  add_foreign_key "gestion_auditorias", "gestion_usuarios", column: "usuario_id"
  add_foreign_key "gestion_evidencias", "gestion_auditorias", column: "auditoria_id"
  add_foreign_key "gestion_evidencias", "gestion_criterios", column: "criterio_id"
  add_foreign_key "gestion_evidencias", "gestion_usuarios", column: "usuario_id"
end
