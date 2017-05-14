module CursoHelper
   #Colocar esto en los environments
   #config.action_view.default_form_builder  = BootstrapFormBuilder
      #Esto es nuevo: hice un generador que genera form_for, y un formbuilder que genra bootstrapform_for. Para no tener que modificar el generador para que genere 
    #bootstrapform_for en lugar de form_for debo usar esta config.
    #
  def bootstrapform_for(record, options = {}, &block)
      options.merge! builder: BootstrapFormBuilder 
      form_for record, options, &block
  end 

end
