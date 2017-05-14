class Domain
  extend SessionsHelper 
@url           = Rails.configuration.x.domain['url_curso']
@name_https    = Rails.configuration.x.domain['name_https']
@name          = Rails.configuration.x.domain['name_http']
@url_curso     = Rails.configuration.x.domain['url_curso']
@email         = Rails.configuration.x.domain['default_from']
@sec_validador_instaladores  = Rails.configuration.x.domain['sec_validador_instaladores']
@assets_prefix = Rails.configuration.x.domain['assets_prefix']
@page_alectrico= Rails.configuration.x.domain['page_alectrico']
@page_access_token = Rails.configuration.x.domain['page_access_token']
@fb_app_id        = Rails.configuration.x.domain['fb_app_id']
@fb_app_secret   = Rails.configuration.x.domain['fb_app_secret']
@propiedad       = Rails.configuration.x.domain['propiedad_google_analytics']
@empresa         = Rails.configuration.x.domain['empresa']
@host_produccion = Rails.configuration.x.domain['name_http_in_the_wild']

def self.get_host_produccion
  @host_produccion
end

def self.empresa
  @empresa
end

def self.get_fb_app_secret
  @fb_app_secret
end
def self.get_propiedad
  @propiedad
end
def self.get_page_access_token
  @page_access_token
end


def self.get_page_alectrico
  @page_alectrico
end

def self.get_foto_id
  @foto_id = Rails.configuration.x.domain['foto_id']
  @foto_id
end

def self.get_modulo
  @modulo        = Rails.configuration.x.domain['modulo']
  @modulo
end

def self.get_name
  @name          = Rails.configuration.x.domain['name']
  @name
end

def self.get_name_http
  @name = Rails.configuration.x.domain['name_http']
end

def self.get_name_http
  @name_http     = Rails.configuration.x.domain['name_http']
  @name_http
end

def self.get_fb_app_id
  @fb_app_id
end

end
