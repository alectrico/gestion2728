# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
 #  inflect.plural /^(ox)$/i, '\1en'
  #  inflect.plural /^(r)$/i, '\1es'
   # inflect.singular /^(or)es/i, '\1'

#    inflect.plural /^(al)$/i,'\1es'
 #   inflect.singular /^(al)es$/i,'\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
    inflect.irregular 'presentacion', 'presentaciones'
    inflect.irregular 'suministrador','suministradores'
    inflect.irregular 'pregunta','preguntas'
    inflect.irregular 'alternativa', 'alternativas'
    inflect.irregular 'prueba','pruebas'
    inflect.irregular 'resultado','resultados'
    inflect.irregular 'modulo', 'modulos' 
    inflect.irregular 'examen', 'examenes'
    inflect.irregular 'participante', 'participantes'
    inflect.irregular 'tema', 'temas'
    inflect.irregular 'objetivo', 'objetivos'
    inflect.irregular 'enrolamiento', 'enrolamientos'
    inflect.irregular 'respuesta', 'respuestas'
    inflect.irregular 'idioma', 'idiomas'
    inflect.irregular 'informatica','informaticas'
    inflect.irregular 'otro' , 'otros'
    inflect.irregular 'material','materiales'
    inflect.irregular 'minuto','minutos'  
    inflect.irregular 'circuito','circuitos'
    inflect.irregular 'conductor','conductores'
    inflect.irregular 'tipo_equipo','tipo_equipos'
    inflect.irregular 'canalizacion','canalizaciones'
    inflect.irregular 'carga','cargas'
    inflect.irregular 'termomagnetico','termomagneticos'
    inflect.irregular 'automatico', 'automaticos'
    inflect.irregular 'diferencial', 'diferenciales'
    inflect.irregular 'canalizacion', 'canalizaciones'
    inflect.irregular 'aislacion', 'aislaciones'
    inflect.irregular 'cx_transporte', 'cx_transportes'
    inflect.irregular 'cx_temperatura', 'cx_temperaturas'
    inflect.irregular 'cubierta', 'cubiertas'
    inflect.irregular 'forro', 'forros'
    inflect.irregular 'conversacion', 'conversaciones'
    inflect.irregular 'texto','textos'
    inflect.irregular 'errors', 'errores'
    inflect.irregular 'auditoria', 'auditorias'

    inflect.irregular 'evidencia', 'evidencias'

    inflect.irregular 'requisito', 'requisitos'
    inflect.irregular 'criterio', 'criterios'
    inflect.irregular 'procedimiento', 'procedimientos'
    inflect.irregular 'politica', 'politicas'

    inflect.irregular 'instalacion','instalaciones'
    inflect.irregular 'evento', 'eventos'
    inflect.irregular 'atencion', 'atenciones'

    inflect.irregular 'plantilla', 'plantillas'
end
