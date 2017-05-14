class LandingPagesController < ElectricoController
 prepend_view_path 'app/views/landing_pages'

#layout 'nomenu', only: [:coming_soon]
#layout 'landing_pages_alectrico_layout', :only => [:index]
#layout false, :only => [:blog]
layout 'landing_pages_alectrico_layout'
  caches_page :coming_soon


def blog

end

def index

end 

def coming_soon

end

def portfolio_2_columns_2

  @proyectos = Presupuesto.con_foto.all

end



end
