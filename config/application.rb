require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsSkeleton
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # --
    config.middleware.use Rack::Cors do
      allow do
        origins "*"
        resource "*",
                 headers: :any,
                 expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
                 methods: [:get, :post, :put, :delete, :options]
      end
    end
    config.active_record.raise_in_transactional_callbacks = true
  end
end
