module Presupuesto::PresupuestosHelper


def enviarlo(p)
   UserMailer.presupuesto(p).deliver
end

def mono_db
  return true if Carga.connection_config[:database] == Presupuesto.connection_config[:database]
end

def fulltest(p)
   @presupuesto = p
   UserMailer.full_test(@presupuesto,nil).deliver
   @presupuesto.full_test_enviado = true
   @presupuesto.save
end

end
