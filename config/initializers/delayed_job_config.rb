begin
  Delayed::Worker.destroy_failed_jobs = false
  Delayed::Worker.sleep_delay = 60
  Delayed::Worker.max_attempts = 3
  Delayed::Worker.max_run_time = 5.minutes
  Delayed::Worker.read_ahead = 10
  Delayed::Worker.default_queue_name = 'default'
#  Delayed::Worker.delay_jobs = !Rails.env.test? #Debe ser true para cucumber y false para rails test. Para cucumber lo controlo en features/support/env.rb
  Delayed::Worker.raise_signal_exceptions = :term
  Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))



  #Delayed::Worker.delay_jobs= !Rails.env.test?
  #esto hace que los trabajos demorados en colas sean enviados inmeidatametne
  #de esa forma se podrán chequerar. con ActionMailer.deliveries
  #Esto solo se hace en test
rescue
end
