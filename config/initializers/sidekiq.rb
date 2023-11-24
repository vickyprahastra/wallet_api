Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL_SIDEKIQ', 'redis://redis:6379/1'), password: ENV["REDIS_PASSWORD"] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL_SIDEKIQ', 'redis://redis:6379/1'), password: ENV["REDIS_PASSWORD"] }
end
