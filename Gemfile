source 'https://rubygems.org'
ruby '2.3.0'

#gem "refile", require: "refile/rails"
#gem "refile-mini_magick"

gem 'devise'
gem 'haml'
gem 'prawn'

group :presupuesto, :development_2728gestion,:gestion2728_heroku do
#  gem 'devise'
end

group  :development_gestion2728, :development_2728gestion, :gestion2728_heroku do
#----------------------------------------------------

#If you'd like to replace Rails's Erb-based generators with Haml, add haml-rails to your Gemfile as well.
##Agregados pr mí, para usar boostrap
#
#gem 'bootstrap', '~> 4.0.0.alpha3'
#gem 'rmagick', '~> 2.15'
#gem 'paperclip'
#----------------------------------------------------
end




#========================================== alectrico =========================


group :development_gestion2728, :gestion2728_heroku, :alectrico, :alectrico_heroku, :electrico_heroku do

#ruby "2.3.0"

#gem 'rack',"1.6.4"
gem 'rack'

gem 'sitemap_generator'
gem 'state_machines', :require => 'state_machines/core'
gem 'state_machines-activerecord'
gem 'ruby-graphviz', :require => 'graphviz'
#gem 'rails_real_favicon'
gem 'phony'
gem 'i18n', '~> 0.7.0'
gem 'momentjs-rails', '>= 2.9.0'
#gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'
gem 'bootstrap3-datetimepicker-rails'
##.-----------http://richonrails.com/articles/basic-ajax-in-ruby-on-rails
#gem 'node'
#gem 'koala'
gem 'delayed_job_active_record'
gem 'will_paginate','~> 3.0.5'
gem 'will_paginate-bootstrap'
#em 'bootstrap-sass', '3.2.0.0'
gem 'bootstrap-sass', '3.3.7'

gem 'autoprefixer-rails'
gem 'dragonfly', "~> 1.0.5"
gem "koala", "~> 2.2"
gem 'actionpack-page_caching'
gem 'thin'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Use postgresql as the database for Active Record
#em 'pg'
# Use postgresql as the database for Active Record
# gem 'pg', '~> 0.18'
#
# Use SCSS for stylesheets
#gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
#gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
 # See https://github.com/sstephenson/execjs#readme for more supported runtimes
 # gem 'therubyracer', platforms: :ruby  consume mucha memoria segun heroku

 # Use jquery as the JavaScript library
# gem 'jquery-rails'
 # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks', '~> 5'
 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
 # bundle exec rake doc:rails generates the API under doc/api.
 gem 'sdoc', '~> 0.4.0', group: :doc

 # Use ActiveModel has_secure_password
 gem 'bcrypt', '~> 3.1.7' #usado para has_secure_password e

 # Use Unicorn as the app server
 # gem 'unicorn'
#
 # Use Capistrano for deployment
 # gem 'capistrano-rails', group: :development
 # gem ':;web-console', '~> 2.0'

=begin
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console

 #gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
=end


end


group :electrico_heroku do
# gem "rails_12factor" para servir assets en el servidor

#  gem 'web-console', '~> 2.0'
#  colocar en electrico_heroku.rb en config/environments
#  config.web_console.development_only = false
#
end


#Modo test para alectrico. Lo usaré para el resto también
#development_gestion2728:
group :development_gestion2728 do
 #gem "rails-html-sanitizer"
 gem "test-unit"  #es necesario porque rspec no lo instala
 gem "webrat", ">=0.7.2"  #para pemtir los metodos get, put, delete, post
# gem "rspec-rails", "2.9.0"

 gem "omniauth-facebook" #Para permitir la autorizacionde de facebook
 #gem 'ZenTest'
 gem 'cucumber-rails', :require => false #da error si no coloco require=> false
 gem 'cucumber-rails-training-wheels' #definiciones prefabricadas
 gem 'database_cleaner' #limpia la base de datos entre corridas de cucumber
 gem 'capybara','~> 2.8' #capybara imita a un web browser

# gem 'capybara','2.2.0'
 gem 'launchy'  #lanza el browser en save de cucumber
 gem 'factory_girl_rails', '1.4.0' #Genera tuplas para pruebas
end

#Grupo alectrico es el que uso en modo local para depurar alectrico
group :alectrico do
#no quiero subrilo a heroku
  gem "seed_dump"
# gem "rspec-rails", "2.9.0"
end


#==============================================================================



#Configuración por defecto para Rails 5 
#De aquí hacia abajo
#-----------------------------------------------------

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
#gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
#gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby Estoy usando node

# Use jquery as the JavaScript library
#gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :development_gestion2728,:development do #test
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development_gestion2728 do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
#
#
#Estos resultaron ser los comunes a alectrico y a rails 5
#development_gestion2728:
group :development_gestion2728, :gestion2728_heroku, :alectrico_heroku, :electrico_heroku, :alectrico do

  gem 'haml-rails'
 gem "rspec-rails", ">= 3.5.0"
 #gem 'factory_girl_rails', '1.4.0' #Genera tuplas para pruebas

  gem 'rails', '~> 5.0.1'
 # Use postgresql as the database for Active Record
 gem 'pg', '~> 0.18'
 # Use SCSS for stylesheets
 gem 'sass-rails', '~> 5.0'
 # Use Uglifier as compressor for JavaScript assets
 gem 'uglifier', '>= 1.3.0'
 # Use CoffeeScript for .coffee assets and views
 gem 'coffee-rails', '~> 4.2'
 # See https://github.com/sstephenson/execjs#readme for more supported runtimes
 # gem 'therubyracer', platforms: :ruby  consume mucha memoria segun heroku
 # Use jquery as the JavaScript library
 gem 'jquery-rails'
 # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
 gem 'turbolinks', '~> 5'
 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
 gem 'jbuilder', '~> 2.5'
 # bundle exec rake doc:rails generates the API under doc/api.

end

group :test do
 gem 'delayed_job_active_record'
  
 #gem "rails-html-sanitizer"
 gem "test-unit"  #es necesario porque rspec no lo instala
 gem "webrat", ">=0.7.2"  #para pemtir los metodos get, put, delete, post
 #%em "rspec-rails", "2.9.0"
 #gem "rspec-rails"

 gem "omniauth-facebook" #Para permitir la autorizacionde de facebook
 #gem 'ZenTest'
 gem 'cucumber-rails', :require => false #da error si no coloco require=> false
 gem 'cucumber-rails-training-wheels' #definiciones prefabricadas
 gem 'database_cleaner' #limpia la base de datos entre corridas de cucumber
#gem 'capybara','1.1.2' #capybara imita a un web browser
 gem 'capybara','~> 2.8'
 #em 'capybara','2.2.0'
 gem 'launchy'  #lanza el browser en save de cucumber
 gem 'factory_girl_rails', '1.4.0' #Genera tuplas para pruebas
end


