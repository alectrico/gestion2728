module Pago::PagosHelper

 def current_transaccion=(tx)
  @current_transaccion == tx
 end

 def current_transaccion
  current_transaccion = @current_transaccion
 end

 def current_transaccion?(tx)
  tx == @current_transaccion 
 end

end
