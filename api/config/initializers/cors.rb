Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'booking-system.dev:4200', 'booking-system.dev'
    resource '*',
             :headers => :any,
             :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
             :methods => [:get, :post, :options, :delete, :put]
  end
end
