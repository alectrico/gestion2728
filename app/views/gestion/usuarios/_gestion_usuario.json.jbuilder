json.extract! gestion_usuario, :id, :nombre, :email, :login, :created_at, :updated_at
json.url gestion_usuario_url(gestion_usuario, format: :json)
