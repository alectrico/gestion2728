class SandboxEmailInterceptor
  def self.delivering_email(message)
    message.to = ['instalaciones.alexsoft@gmail.com']
  end
end
