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

ActiveRecord::Schema.define(version: 20170210171204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aislaciones", force: :cascade do |t|
    t.string   "nombre"
    t.decimal  "tmaxima"
    t.string   "alma"
    t.boolean  "es_conductor_proteccion_no_agrupado"
    t.boolean  "es_conductor_activo_o_proteccion_multiconductor"
    t.integer  "K"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alternativas", force: :cascade do |t|
    t.string   "enunciado"
    t.boolean  "correcta"
    t.integer  "pregunta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "filename"
    t.integer  "presupuesto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "automaticos", force: :cascade do |t|
    t.integer  "poder_corte"
    t.integer  "corriente_nominal"
    t.string   "curva"
    t.boolean  "es_monofasico"
    t.boolean  "es_bifasico"
    t.boolean  "es_trifasico"
    t.boolean  "es_mcb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "es_diferencial"
    t.integer  "tension"
  end

  create_table "canalizaciones", force: :cascade do |t|
    t.integer  "diametro_en_mm"
    t.integer  "diametro_en_pulgada"
    t.boolean  "es_embutida"
    t.boolean  "es_rigida"
    t.boolean  "es_sobrepuesta"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "diametro_interior"
    t.decimal  "seccion_transversal"
  end

  create_table "cargas", force: :cascade do |t|
    t.integer  "tipo_equipo_id"
    t.string   "cargolizable_type"
    t.integer  "cargolizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cantidad"
  end

  create_table "carriers", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "tarifa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categoria_materiales", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cesta_cables", force: :cascade do |t|
    t.string   "color"
    t.integer  "awg"
    t.integer  "area"
    t.integer  "cantidad"
    t.integer  "forro_id"
    t.integer  "tipo_material_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.decimal  "seccion"
    t.string   "comentario"
    t.decimal  "subtotal"
    t.string   "grupo_canalizacion"
    t.integer  "material_id"
    t.integer  "izth"
    t.integer  "conductor_id"
  end

  create_table "circuitos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "tipo"
    t.integer  "largo"
    t.integer  "capacidad"
    t.decimal  "corriente_servicio"
    t.integer  "poder_corte"
    t.integer  "extension_picado"
    t.integer  "carga_total"
    t.integer  "im"
    t.string   "curva"
    t.integer  "extension_pvc"
    t.integer  "extension_conductor"
    t.integer  "no_fases"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "presupuesto_id"
    t.integer  "tipo_circuito_id"
    t.integer  "conductor_id"
    t.integer  "costo"
    t.integer  "grupo"
    t.integer  "tension"
    t.integer  "tamb"
    t.integer  "tramo_hormigon"
    t.integer  "tramo_entretecho"
    t.integer  "tramo_exterior"
    t.integer  "izth"
    t.decimal  "ampliacion"
    t.decimal  "inominal"
    t.boolean  "es_monofasico"
    t.boolean  "es_trifasico"
    t.boolean  "no_valido"
    t.boolean  "es_valido"
    t.boolean  "tiene_automatico"
    t.integer  "automatico_id"
    t.decimal  "AV"
    t.decimal  "fp"
    t.decimal  "Iz"
    t.decimal  "corriente_sin_fp"
    t.decimal  "fpc"
    t.integer  "iteracion"
    t.decimal  "LMax"
    t.decimal  "Ia"
    t.boolean  "es_alimentador"
    t.integer  "canalizacion_id"
    t.integer  "aislacion_id"
    t.integer  "forro_id"
    t.decimal  "factor_diversidad"
    t.decimal  "is_medido"
    t.decimal  "potencia_activa_medida"
    t.decimal  "potencia_aparente_medida"
    t.decimal  "fp_medido"
    t.decimal  "demanda_maxima"
    t.decimal  "carga_conectada"
    t.decimal  "max_spur"
    t.boolean  "es_capacitor"
    t.boolean  "es_datos"
    t.text     "memoria"
    t.text     "proteccion"
    t.text     "proteccionD1"
    t.text     "proteccionD2"
    t.text     "proteccionD3"
    t.string   "type"
    t.text     "instalacion"
  end

  create_table "conductores", force: :cascade do |t|
    t.integer  "izth"
    t.decimal  "seccion"
    t.integer  "awg"
    t.integer  "tamb"
    t.string   "grupo"
    t.string   "ref"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tservicio"
    t.decimal  "Iz"
    t.string   "alma"
    t.integer  "espesor",    default: 0
  end

  create_table "contenidos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "modulo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tema_id"
  end

  create_table "conversaciones", force: :cascade do |t|
    t.string "contenido"
  end

  create_table "costos", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "costo_unitario"
    t.integer  "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo_costo"
    t.integer  "tipo_costo_id"
    t.integer  "presupuesto_id"
    t.boolean  "esproyectado"
    t.boolean  "es_incurrido"
    t.string   "costolizable_type"
    t.integer  "costolizable_id"
  end

  create_table "costos_presupuestos", id: false, force: :cascade do |t|
    t.integer "costo"
    t.integer "presupuesto"
    t.integer "presupuesto_id"
    t.integer "costo_id"
  end

  create_table "create_botones", force: :cascade do |t|
    t.decimal  "mc_gross"
    t.string   "mc_currency"
    t.string   "item_name"
    t.string   "item_number"
    t.string   "path"
    t.boolean  "mobi"
    t.boolean  "alectrico"
    t.boolean  "suscripcion"
    t.boolean  "pdf"
    t.boolean  "promote_to_member"
    t.boolean  "sandbox"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "item_id"
    t.string   "success"
    t.string   "cancel"
    t.string   "business"
    t.string   "controller"
    t.string   "action"
  end

  create_table "create_une_experiencia", force: :cascade do |t|
    t.integer  "orden"
    t.integer  "cv_id"
    t.integer  "experiencium_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "create_une_experiencias", force: :cascade do |t|
    t.integer  "orden"
    t.integer  "cv_id"
    t.integer  "experiencia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "create_une_formacions", force: :cascade do |t|
    t.integer  "orden"
    t.integer  "cv_id"
    t.integer  "formacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "create_une_idiomas", force: :cascade do |t|
    t.integer  "orden"
    t.integer  "cv_id"
    t.integer  "idioma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "create_une_informaticas", force: :cascade do |t|
    t.integer  "orden"
    t.integer  "cv_id"
    t.integer  "informatica_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "create_une_otros", force: :cascade do |t|
    t.integer  "orden"
    t.integer  "cv_id"
    t.integer  "otro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "create_uneformaciones", force: :cascade do |t|
    t.integer  "orden"
    t.integer  "cv_id"
    t.integer  "formacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cvs", force: :cascade do |t|
    t.string   "nombre"
    t.string   "string"
    t.string   "materno"
    t.string   "paterno"
    t.string   "calle"
    t.integer  "numero"
    t.integer  "codigo"
    t.integer  "fono"
    t.integer  "celular"
    t.string   "email"
    t.integer  "experiencia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "foto_id"
    t.integer  "user_id"
    t.string   "para_email"
  end

  create_table "cx_temperaturas", force: :cascade do |t|
    t.integer  "tamb"
    t.decimal  "t1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cx_transportes", force: :cascade do |t|
    t.integer  "min_conductores"
    t.integer  "max_conductores"
    t.decimal  "fn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "documentos", force: :cascade do |t|
    t.string   "titulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ediciones", force: :cascade do |t|
    t.string   "titulo"
    t.string   "serie"
    t.datetime "fecha_lanzamiento"
    t.string   "edicion"
    t.text     "descripcion"
    t.string   "revision"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cubierta",          default: ""
    t.string   "url",               default: ""
    t.string   "amazon",            default: "http://www.amazon.com/Alexander-Espinosa/e/B0044ZWP2S"
    t.string   "createspace",       default: "https://www.createspace.com/3728243"
    t.integer  "semana"
    t.integer  "modulo_id"
    t.integer  "orden"
  end

  create_table "enrolamientos", force: :cascade do |t|
    t.integer  "modulo_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.datetime "fecha"
    t.integer  "presupuesto_id"
    t.string   "email"
    t.string   "nombre"
    t.integer  "fono"
    t.string   "direccion"
    t.boolean  "openevent"
    t.string   "type"
    t.string   "coordenadas"
  end

  create_table "examenes", force: :cascade do |t|
    t.integer  "prueba_id"
    t.integer  "participante_id"
    t.datetime "fecha"
    t.time     "demora"
    t.boolean  "aprobado"
    t.decimal  "nota"
    t.integer  "total"
    t.integer  "buenas"
    t.integer  "malas"
    t.integer  "regular"
    t.integer  "omitidas"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "nunca_abierto"
    t.string   "estado"
  end

  create_table "experiencia", force: :cascade do |t|
    t.integer  "desde"
    t.integer  "hasta"
    t.string   "cargo"
    t.string   "funcion"
    t.string   "empresa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cv_id"
    t.integer  "user_id"
    t.integer  "foto_id"
    t.date     "comienzo"
    t.date     "final"
    t.string   "lugar"
    t.string   "ciudad"
    t.string   "pais"
    t.string   "url"
    t.string   "color",       default: "background-color: rgb(255,216,216)"
    t.text     "descripcion"
  end

  create_table "facebook_oauth_settings", force: :cascade do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "flaps", force: :cascade do |t|
    t.integer  "start"
    t.integer  "end"
    t.string   "url"
    t.integer  "edicione_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["edicione_id"], name: "index_flaps_on_edicione_id", using: :btree
  end

  create_table "formacions", force: :cascade do |t|
    t.string   "titulo"
    t.date     "desde"
    t.date     "hasta"
    t.string   "lugar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cv_id"
    t.integer  "user_id"
    t.integer  "foto_id"
    t.date     "comienzo"
    t.date     "final"
    t.string   "ciudad"
    t.string   "pais"
    t.string   "url"
    t.string   "color",       default: "background-color: rgb(255,255,216)"
    t.text     "descripcion"
  end

  create_table "forros", id: false, force: :cascade do |t|
    t.string   "id"
    t.integer  "aislacion_id"
    t.integer  "temperatura_servicio"
    t.string   "chaqueta_exterior"
    t.boolean  "es_unipolar"
    t.boolean  "es_multipolar"
    t.boolean  "ambiente_seco"
    t.boolean  "ambiente_humedo"
    t.boolean  "ambiente_mojado"
    t.integer  "grupo_canalizacion"
    t.boolean  "resiste_aceites"
    t.boolean  "resiste_grasas"
    t.boolean  "resiste_acidos"
    t.boolean  "resiste_gasolina"
    t.boolean  "emite_gases_toxicos"
    t.boolean  "emite_gases_corrosivos"
    t.boolean  "libre_de_halogenos"
    t.boolean  "uso_interior"
    t.boolean  "uso_exterior"
    t.boolean  "instalacciones_aereas"
    t.boolean  "instalaciones_subterraneas"
    t.boolean  "en_ducto"
    t.boolean  "sin_ducto"
    t.boolean  "en_tuberia"
    t.boolean  "en_bandeja"
    t.boolean  "en_escalerilla"
    t.boolean  "en_moldura"
    t.boolean  "en_acometida"
    t.boolean  "fuera_del_alcance"
    t.boolean  "sin_uv"
    t.boolean  "directamente_en_tierra"
    t.boolean  "tendido_subterraneo"
    t.boolean  "instalacion_sobrepuesta_sin_ducto"
    t.boolean  "para_alambre"
    t.boolean  "para_cable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "letras"
    t.boolean  "no_emite_gases_toxicos_ni_corrosivos"
    t.integer  "forrizable_id"
    t.integer  "forrizable_type"
  end

  create_table "fotos", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "tipo_contenido"
    t.string   "nombre_archivo"
    t.binary   "bits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cv_id"
    t.integer  "user_id"
    t.binary   "thumbnail"
    t.string   "tempfile"
    t.string   "image_uid"
    t.string   "image_name"
    t.integer  "presupuesto_id"
    t.integer  "fotolizable_id"
    t.string   "fotolizable_type"
  end

  create_table "idiomas", force: :cascade do |t|
    t.string   "idioma"
    t.string   "dominio"
    t.string   "certificado"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cv_id"
    t.integer  "user_id"
    t.integer  "foto_id"
    t.date     "comienzo"
    t.date     "final"
    t.string   "lugar"
    t.string   "ciudad"
    t.string   "pais"
    t.string   "titulo"
    t.string   "color",       default: "background-color: rgb(255,216,255)"
    t.text     "descripcion"
  end

  create_table "informaticas", force: :cascade do |t|
    t.string   "software"
    t.string   "dominio"
    t.string   "sistema"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cv_id"
    t.integer  "user_id"
    t.integer  "foto_id"
    t.date     "comienzo"
    t.date     "final"
    t.string   "lugar"
    t.string   "ciudad"
    t.string   "pais"
    t.string   "titulo"
    t.string   "color",       default: "background-color: rgb(216,216,255)"
    t.text     "descripcion"
  end

  create_table "llamadas", force: :cascade do |t|
    t.string   "fono"
    t.integer  "minutos"
    t.integer  "carrier_id"
    t.text     "contenido"
    t.integer  "costo"
    t.boolean  "bueno"
    t.boolean  "neutro"
    t.boolean  "malo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "presupuesto_id"
  end

  create_table "materiales", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "categoria_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "costo"
    t.boolean  "ya_lo_compre"
    t.boolean  "ya_me_lo_pagaron"
    t.boolean  "ya_lo_instale"
    t.boolean  "me_sobro"
    t.integer  "proveedor_id"
    t.integer  "cantidad"
    t.boolean  "merma_de_rollo"
    t.integer  "presupuesto_id"
    t.integer  "tipo_material_id"
    t.string   "materializable_type"
    t.integer  "materializable_id"
  end

  create_table "materiales_de_presupuestos", id: false, force: :cascade do |t|
    t.integer "material_id"
    t.integer "presupuesto_id"
  end

  create_table "materiales_presupuestos", id: false, force: :cascade do |t|
    t.integer "material_id",      null: false
    t.integer "presupuesto_id",   null: false
    t.boolean "ya_lo_instale"
    t.integer "proveedor_id"
    t.boolean "ya_me_lo_pagaron"
    t.boolean "ya_lo_compre"
    t.boolean "sobro"
    t.index ["material_id", "presupuesto_id"], name: "index_materiales_presupuestos_on_material_id_and_presupuesto_id", unique: true, using: :btree
  end

  create_table "microposts", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contexto"
    t.integer  "foto_id"
    t.string   "titulo"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
  end

  create_table "modulos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "inicio"
    t.datetime "fin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semana",     default: 0
    t.integer  "cupo",       default: 20
    t.integer  "duracion"
  end

  create_table "objetivos", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prueba_id"
  end

  create_table "otros", force: :cascade do |t|
    t.string   "item"
    t.string   "relevancia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cv_id"
    t.integer  "user_id"
    t.integer  "foto_id"
    t.date     "comienzo"
    t.date     "final"
    t.string   "lugar"
    t.string   "ciudad"
    t.string   "pais"
    t.string   "titulo"
    t.string   "color",       default: "background-color: rgb(216,255,255)"
    t.text     "descripcion"
  end

  create_table "pagos", force: :cascade do |t|
    t.string   "tx"
    t.string   "st"
    t.string   "amt"
    t.string   "cc"
    t.string   "cm"
    t.string   "item_number"
    t.string   "sig"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "id_cliente"
    t.string   "resultado"
    t.string   "last_name"
    t.string   "transaction_subject"
    t.datetime "payment_date"
    t.string   "txn_type"
    t.string   "subscr_id"
    t.string   "residence_country"
    t.string   "item_name"
    t.string   "payment_gross"
    t.string   "mc_currency"
    t.string   "business"
    t.string   "payment_type"
    t.string   "protection_eligibility"
    t.string   "payer_status"
    t.string   "payer_email"
    t.string   "receiver_email"
    t.string   "first_name"
    t.string   "payer_id"
    t.string   "receiver_id"
    t.string   "item_number2"
    t.string   "payment_status"
    t.string   "payment_fee"
    t.string   "mc_fee"
    t.string   "btn_id"
    t.string   "mc_gross"
    t.string   "charset"
    t.integer  "user_id"
    t.integer  "paye_id"
    t.string   "payment_date_string"
    t.boolean  "sandbox"
    t.string   "host"
    t.string   "remote_ip"
    t.integer  "create_botone_id"
    t.string   "custom"
  end

  create_table "partes", force: :cascade do |t|
    t.integer  "pregunta_id"
    t.integer  "prueba_id"
    t.integer  "orden"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participantes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preguntas", force: :cascade do |t|
    t.string   "enunciado"
    t.integer  "tipo_id"
    t.decimal  "puntaje"
    t.integer  "contenido_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prueba_id"
    t.text     "explicacion"
  end

  create_table "presupuestos", force: :cascade do |t|
    t.string   "name"
    t.text     "descripcion"
    t.integer  "precio"
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "formato_web"
    t.string   "formato_mail"
    t.string   "formato_pdf"
    t.integer  "email"
    t.string   "seguimiento"
    t.text     "informe_terreno"
    t.date     "fecha_visita"
    t.text     "solicitado"
    t.text     "indicaciones"
    t.text     "constatado"
    t.boolean  "vigente"
    t.boolean  "presupuestar"
    t.boolean  "visitar"
    t.boolean  "porllamar"
    t.boolean  "pagado"
    t.boolean  "mellamaran"
    t.boolean  "trabajando"
    t.integer  "lo_cobrado"
    t.boolean  "es_citofonia"
    t.boolean  "es_electricidad"
    t.boolean  "es_control"
    t.integer  "admin_id"
    t.boolean  "ya_invitado"
    t.boolean  "ya_enviado"
    t.boolean  "materiales_enviados"
    t.boolean  "levantamiento_enviado"
    t.boolean  "explicacion_enviada"
    t.boolean  "mano_de_obra_enviada"
    t.decimal  "Is"
    t.integer  "P"
    t.decimal  "costo_circuitos"
    t.boolean  "es_datos"
    t.boolean  "full_test_enviado"
    t.boolean  "rotten"
    t.boolean  "cien_mil_enviado"
    t.integer  "foto_id"
    t.boolean  "te1"
    t.boolean  "unilineal"
    t.boolean  "plano"
    t.boolean  "tablero"
    t.boolean  "tierra"
    t.boolean  "aislamiento"
    t.boolean  "r_tierra"
    t.string   "te1_name"
    t.string   "te1_url"
    t.integer  "te1_foto_id"
    t.boolean  "datos_pago_enviados"
    t.boolean  "ano_nuevo_enviado"
    t.integer  "instalador_id"
    t.string   "remember_token"
    t.integer  "plano_foto_id"
    t.boolean  "croquis"
    t.boolean  "casa_habitacion"
    t.integer  "adelanto"
    t.text     "instalacion"
    t.text     "proteccionD1"
    t.text     "proteccionD2"
    t.integer  "no_fases"
    t.integer  "skq"
    t.integer  "str"
    t.integer  "uo"
    t.integer  "un"
    t.integer  "ucc"
    t.boolean  "manual_enviado"
  end

  create_table "proveedors", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pruebas", force: :cascade do |t|
    t.integer  "modulo_id"
    t.integer  "objetivo_id"
    t.integer  "tema_id"
    t.string   "titulo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semana",      default: 0
    t.text     "objetivos"
    t.integer  "duracion"
  end

  create_table "recintos", force: :cascade do |t|
    t.string   "nombre"
    t.float    "superficie"
    t.string   "ip"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "recintable_id"
    t.string   "recintable_type"
    t.integer  "tipo_recinto_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "respuestas", force: :cascade do |t|
    t.integer  "alternativa_id"
    t.integer  "pregunta_id"
    t.integer  "examen_id"
    t.boolean  "correcta"
    t.boolean  "respondida"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "credito"
  end

  create_table "temas", force: :cascade do |t|
    t.string   "nombre"
    t.boolean  "enaccion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "modulo_id"
  end

  create_table "tipo_circuitos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "requiere_diferencial"
  end

  create_table "tipo_costos", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "string"
    t.integer  "monto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_equipos", force: :cascade do |t|
    t.string   "nombre"
    t.decimal  "i"
    t.integer  "p"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "modelo"
    t.boolean  "genera_armonicos"
    t.decimal  "Ip"
    t.decimal  "tp"
    t.integer  "tension"
    t.boolean  "es_trifasico"
    t.boolean  "es_bifasico"
    t.boolean  "es_monofasico"
    t.decimal  "fp"
    t.string   "curva"
    t.integer  "eficiencia"
    t.decimal  "capacitancia_necesaria"
    t.boolean  "es_capacitor"
  end

  create_table "tipo_materiales", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "costo"
    t.string   "string"
    t.string   "unidad"
    t.integer  "proveedor_id"
    t.text     "descripcion"
    t.integer  "unidades_por_caja"
    t.string   "codigo"
    t.integer  "forro_id"
  end

  create_table "tipo_recintos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "minimo_de_luminarias"
    t.integer  "minimo_de_interruptores"
    t.integer  "minimo_de_enchufes"
    t.integer  "area_de_zonas_de_luz"
    t.integer  "area_de_zonas_de_enchufes"
    t.integer  "tipo_de_enchufe"
    t.integer  "potencia_minima"
    t.boolean  "exige_diferencial"
    t.integer  "indice_de_proteccion_minimo"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "tipo_toma_corrientes", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "i_nominal"
    t.integer  "modulos"
    t.boolean  "interconectado"
    t.integer  "potencia_promedio"
    t.integer  "potencia_asignada"
    t.integer  "indice_de_proteccion"
    t.string   "marca"
    t.string   "modelo"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "tipopreguntas", force: :cascade do |t|
    t.string   "categoria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todos", force: :cascade do |t|
    t.string   "title"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                  default: false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "member"
    t.boolean  "client"
    t.boolean  "alumno"
    t.boolean  "profesor"
    t.integer  "presupuesto_id"
    t.string   "fono"
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
    t.index ["member"], name: "index_users_on_member", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
