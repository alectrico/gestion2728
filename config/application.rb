require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GestionSite
  class Application < Rails::Application

    config.domain = config_for(:domain)

    config.generators do |g|
      g.orm :active_record
      g.template_engine :haml
      g.test_framework :test_unit, fixture: false
      g.stylesheets false #usdo form_for sobrecargado con bootstrap_builder
      g.javascripts false
      g.helper :sidebar
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]

    config.i18n.default_locale = :es_Cl

  end
end
