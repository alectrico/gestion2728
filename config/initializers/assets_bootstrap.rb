if true

  # Precompile additional assets.
  Rails.application.config.assets.precompile += %w( B4/bootstrap/bootstrap.min.css)
  Rails.application.config.assets.precompile += %w( B4/bootstrap.min.js)
  Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.min.js)
  Rails.application.config.assets.precompile += %w( jquery/jquery-3.1.1.slim.min.js ) 

  #css de cada controlador de los de ejemplos de bootstrap
  Rails.application.config.assets.precompile += %w( bootstrap/album.css )
  Rails.application.config.assets.precompile += %w( bootstrap/blog.css )
  Rails.application.config.assets.precompile += %w( bootstrap/carousel.css )
  Rails.application.config.assets.precompile += %w( bootstrap/cover.css )
  Rails.application.config.assets.precompile += %w( bootstrap/dashboard.css )
  Rails.application.config.assets.precompile += %w( bootstrap/grid.css )
  Rails.application.config.assets.precompile += %w( bootstrap/jumbotron.css )
  Rails.application.config.assets.precompile += %w( bootstrap/justified_nav.css )
  Rails.application.config.assets.precompile += %w( bootstrap/narrow_jumbotron.css)
  Rails.application.config.assets.precompile += %w( bootstrap/navbars.css )
  Rails.application.config.assets.precompile += %w( bootstrap/navbar_top.css )
  Rails.application.config.assets.precompile += %w( bootstrap/navbar_top_fixed.css )
  Rails.application.config.assets.precompile += %w( bootstrap/offcanvas.css )
  Rails.application.config.assets.precompile += %w( bootstrap/signin.css )
  Rails.application.config.assets.precompile += %w( bootstrap/starter_template.css )
  Rails.application.config.assets.precompile += %w( bootstrap/sticky_footer.css)
  Rails.application.config.assets.precompile += %w( bootstrap/sticky_footer_navbar.css)
  Rails.application.config.assets.precompile += %w( bootstrap/tooltip_viewport.css )

  Rails.application.config.assets.precompile += %w( bootstrap/album.js )
  Rails.application.config.assets.precompile += %w( bootstrap/blog.js )
  Rails.application.config.assets.precompile += %w( bootstrap/carousel.js )
  Rails.application.config.assets.precompile += %w( bootstrap/cover.js )
  Rails.application.config.assets.precompile += %w( bootstrap/dashboard.js )
  Rails.application.config.assets.precompile += %w( bootstrap/grid.js )
  Rails.application.config.assets.precompile += %w( bootstrap/jumbotron.js )
  Rails.application.config.assets.precompile += %w( bootstrap/justified_nav.js )
  Rails.application.config.assets.precompile += %w( bootstrap/narrow_jumbotron.js)
  Rails.application.config.assets.precompile += %w( bootstrap/navbars.js )
  Rails.application.config.assets.precompile += %w( bootstrap/navbar_top.js )
  Rails.application.config.assets.precompile += %w( bootstrap/navbar_top_fixed.js )
  Rails.application.config.assets.precompile += %w( bootstrap/offcanvas.js )
  Rails.application.config.assets.precompile += %w( bootstrap/signin.js )
  Rails.application.config.assets.precompile += %w( bootstrap/starter_template.js )
  Rails.application.config.assets.precompile += %w( bootstrap/sticky_footer.js)
  Rails.application.config.assets.precompile += %w( bootstrap/sticky_footer_navbar.js)
  Rails.application.config.assets.precompile += %w( bootstrap/tooltip_viewport.js )



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
