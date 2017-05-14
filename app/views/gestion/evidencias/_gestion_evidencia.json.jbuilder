json.extract! gestion_evidencia, :id, :auditoria_id, :criterio_id, :usuario_id, :image_uid, :image_name, :tipo_contenido, :nombre_archivo, :bits, :thumbnail, :tempfile, :descripcion, :lugar, :estado, :created_at, :updated_at
json.url gestion_evidencia_url(gestion_evidencia, format: :json)
