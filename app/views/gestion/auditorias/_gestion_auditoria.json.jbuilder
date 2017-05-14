json.extract! gestion_auditoria, :id, :auditor_id, :registro_id, :created_at, :updated_at
json.url gestion_auditoria_url(gestion_auditoria, format: :json)
