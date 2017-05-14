class ApplicationMailer < ActionMailer::Base
  default from: Rails.configuration.domain['default_from']

end
