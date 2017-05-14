json.extract! gestion_registro, :id, :region, :rut, :dv, :razon_social, :nombre_fantasia, :direccion, :comuna, :fono, :comportamiento, :email, :email_secundario, :created_at, :updated_at
json.url gestion_registro_url(gestion_registro, format: :json)
