json.extract! presupuesto_foto, :id, :descripcion, :tipo_contenido, :nombre_archivo, :bits, :thumbnail, :tempfile, :image_uid, :image_name, :fotolizable_id, :fotolizable_type, :cv_id, :presupuesto_id, :created_at, :updated_at
json.url presupuesto_foto_url(presupuesto_foto, format: :json)
