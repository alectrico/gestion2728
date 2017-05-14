if Rails.env.development2728?
  ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)
end
