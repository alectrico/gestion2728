module Curso::ModulosHelper

#	Esta es la forma que encontre para decidir si un modulo está vigente
#	1. Ver si hay modulos creados, sino para que
#	2. En los módulos creados verificar si la fecha de inicio y la duración
#	   sobrepasan el tiempo actual
#	3. En el caso de modulos con comienzo y duracion gastados antes del tiempo
#	   actual se onsdieran vencidos, en estos casos se imprime un reporte en 
#	   pantalla y lugo se renuvan considernaod l comienzo como tiempo
#	   actual y el fin como tiempo actual mas la drueacion contemplada



def current_modulos
  if Curso::Modulo.count > 0
    @vencidos = Curso::Modulo.all.select{|modulo| !modulo.fin.nil? and modulo.fin.< Time.now and modulo.duracion.> 0}
    @vencidos.each do |modulo| 
      logger.info "renovando"
      logger.info modulo.nombre
      logger.info modulo.inicio
      logger.info modulo.fin
      modulo.inicio = Time.now
      modulo.fin = (modulo.duracion).weeks.since(Time.now)
      modulo.save
    end
   
    @current_modulos = Curso::Modulo.all.select {|modulo| !modulo.inicio.nil? and modulo.inicio.<= Time.now and modulo.fin.> Time.now}
  else
    @current_modulos = Curso::Modulo.all.select {|modulo| !modulo.inicio.nil? and modulo.inicio.<= Time.now and modulo.fin.> Time.now}

  end
end 

end
