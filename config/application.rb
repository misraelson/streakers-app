require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StreakersApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # Don't generate system test files.
    config.generators.system_tests = nil
    #config time zone PACIFIC for active record
    config.time_zone = 'Pacific Time (US & Canada)'

    # REMOVE THIS LINE AFTER ALL SORTED => added this line because of error when sending data from react app
    config.action_controller.forgery_protection_origin_check = false

    config.active_job.queue_adapter = :sidekiq

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3000'
        resource( '*',
        headers: :any,
        :methods => [:get, :patch, :post, :put, :delete, :options]
        )
      end
    end

    config.to_prepare do
      DeviseController.respond_to :html, :json
    end

  end
end
