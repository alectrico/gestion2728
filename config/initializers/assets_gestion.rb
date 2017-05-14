if true
 


  Rails.application.config.assets.precompile += %w( gestion/gestion.css)

  Rails.application.config.assets.precompile += %w( main.css)

  Rails.application.config.assets.precompile += %w( dropify/dropify.js)
  #Rails.application.config.assets.precompile += %w( dropify/demo.css)
  Rails.application.config.assets.precompile += %w( dropify.css)



  # Precompile additional assets.
  Rails.application.config.assets.precompile += %w( gestion/bootstrap.min.css)
  Rails.application.config.assets.precompile += %w( jquery-2.1.3.js)
  Rails.application.config.assets.precompile += %w( B4/bootstrap.js) #para devise
  Rails.application.config.assets.precompile += %w( devise.css) #para devise
  Rails.application.config.assets.precompile += %w( devise.js) #para devise


  Rails.application.config.assets.precompile += %w( B4/bootstrap/bootstrap.css) #para devise
  Rails.application.config.assets.precompile += %w( B337/bootstrap/custom.css) #para devise
  Rails.application.config.assets.precompile += %w( B337/bootstrap/custom.js) #para devise

  Rails.application.config.assets.precompile += %w( B3220/main.css)  #para multipurpose en uno y gestion
  Rails.application.config.assets.precompile += %w( gestion/bootstrap.js)
  Rails.application.config.assets.precompile += %w( gestion/bootstrap.min.js)
  Rails.application.config.assets.precompile += %w( jquery/jquery-3.1.1.slim.min.js ) 

  #css de cada controlador de los de ejemplos de bootstrap
  Rails.application.config.assets.precompile += %w( gestion/album.css )
  Rails.application.config.assets.precompile += %w( gestion/blog.css )
  Rails.application.config.assets.precompile += %w( gestion/carousel.css )
  Rails.application.config.assets.precompile += %w( gestion/cover.css )
  Rails.application.config.assets.precompile += %w( gestion/dashboard.css )
  Rails.application.config.assets.precompile += %w( gestion/grid.css )
  Rails.application.config.assets.precompile += %w( gestion/jumbotron.css )
  Rails.application.config.assets.precompile += %w( gestion/justified_nav.css )
  Rails.application.config.assets.precompile += %w( gestion/narrow_jumbotron.css)
  Rails.application.config.assets.precompile += %w( gestion/navbars.css )
  Rails.application.config.assets.precompile += %w( gestion/navbar_top.css )
  Rails.application.config.assets.precompile += %w( gestion/navbar_top_fixed.css )
  Rails.application.config.assets.precompile += %w( gestion/offcanvas.css )
  Rails.application.config.assets.precompile += %w( gestion/signin.css )
  Rails.application.config.assets.precompile += %w( gestion/starter_template.css )
  Rails.application.config.assets.precompile += %w( gestion/sticky_footer.css)
  Rails.application.config.assets.precompile += %w( gestion/sticky_footer_navbar.css)


  Rails.application.config.assets.precompile += %w( gestion/registro_otecs.js )
  Rails.application.config.assets.precompile += %w( gestion/tooltip_viewport.css )

  Rails.application.config.assets.precompile += %w( gestion/album.js )
  Rails.application.config.assets.precompile += %w( gestion/blog.js )
  Rails.application.config.assets.precompile += %w( gestion/carousel.js )
  Rails.application.config.assets.precompile += %w( gestion/cover.js )
  Rails.application.config.assets.precompile += %w( gestion/dashboard.js )
  Rails.application.config.assets.precompile += %w( gestion/grid.js )
  Rails.application.config.assets.precompile += %w( gestion/jumbotron.js )
  Rails.application.config.assets.precompile += %w( gestion/justified_nav.js )
  Rails.application.config.assets.precompile += %w( gestion/narrow_jumbotron.js)
  Rails.application.config.assets.precompile += %w( gestion/navbars.js )
  Rails.application.config.assets.precompile += %w( gestion/navbar_top.js )
  Rails.application.config.assets.precompile += %w( gestion/navbar_top_fixed.js )
  Rails.application.config.assets.precompile += %w( gestion/offcanvas.js )
  Rails.application.config.assets.precompile += %w( gestion/signin.js )
  Rails.application.config.assets.precompile += %w( gestion/starter_template.js )
  Rails.application.config.assets.precompile += %w( gestion/sticky_footer.js)
  Rails.application.config.assets.precompile += %w( gestion/sticky_footer_navbar.js)
  Rails.application.config.assets.precompile += %w( gestion/tooltip_viewport.js )



  #----------------- Components ---------------------------------------------

  Rails.application.config.assets.precompile += %w( carbon/carbon.js )
  Rails.application.config.assets.precompile += %w( carbon/element.js )
  Rails.application.config.assets.precompile += %w( carbon/property.js )


  Rails.application.config.assets.precompile += %w( app-touch-icon.png )
  Rails.application.config.assets.precompile += %w( app-touch-icon )
  Rails.application.config.assets.precompile += %w( favicon.ico   )
  Rails.application.config.assets.precompile += %w( search.json   )

  Rails.application.config.assets.precompile += %w( jekyll/vendor/tether.min.js )
  Rails.application.config.assets.precompile += %w( jekyll/vendor/anchor.min.js )
  Rails.application.config.assets.precompile += %w( jekyll/vendor/clipboard.min.js )
  Rails.application.config.assets.precompile += %w( jekyll/vendor/holder.min.js )
  Rails.application.config.assets.precompile += %w( jekyll/vendor/jekyll-search.min.js)

  Rails.application.config.assets.precompile += %w( jekyll/docs.min.css  )
  Rails.application.config.assets.precompile += %w( jekyll/ie10-viewport-bug-workaround.js)
  Rails.application.config.assets.precompile += %w( jekyll/ie-emulation-modes-warning.js)


  #------ navbar
  Rails.application.config.assets.precompile += %w( brand/bootstrap-solid.svg)
  #--------------------------------------------------------------------------
end
