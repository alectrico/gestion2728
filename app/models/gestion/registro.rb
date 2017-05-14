class Gestion::Registro < GestionBase
   include ActiveSupport::NumberHelper
   has_many :auditorias,     dependent: :nullify, inverse_of: :registro
  
   
   enum presentacion: [:presentada, :no_presentada]
   #presentada es cuando se dirige un email con una presentacion en pdf hacia el clente
   #no presentada es cuando nunca se haya dirigido tal email
   enum auditoria: [:en_auditoria, :auditoria_finalizada]
   #en auditoria es cuando al menos un auditor ha sido asignado al registro de otec
   #auditoria finalizada es cuando no haya ningun auditor relacionaod al registro de otec dado
   #
   default_scope -> { order('auditoria ASC') }

   def rut
     b = number_to_currency(super).gsub('$','RUT:') if super
     "#{b}"
   end

   def fono
     "Fono: #{super}"
   end


   def intenta_finalizar_auditoria
     if self.auditorias.each.count == 0 
       self.auditoria = :auditoria_finalizada
       self.save 
     end
   end

   def inicia_auditoria
     self.auditoria = :en_auditoria
     self.save
   end


end
