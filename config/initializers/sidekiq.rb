Sidekiq.configure_server do |config|
  # DEVELOPMENT
  # config.redis = { url: 'redis://localhost:6379/0'  }
  # PRODUCTION
  config.redis = { url: ENV['REDIS_URL']  }
  schedule_file = "config/schedule.yml"
  if File.exists?(schedule_file) && Sidekiq.server?
    Sidekiq::Cron::Job.load_from_hash! YAML.load_file(schedule_file)
  end
end

Sidekiq.configure_client do |config|
  # DEVELOPMENT
  # config.redis = { url: 'redis://localhost:6379/0'  }
  # PRODUCTION
  config.redis = { url: ENV['REDIS_URL'] }
end
