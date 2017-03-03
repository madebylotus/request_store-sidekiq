require "request_store"
require "sidekiq"

require "request_store/sidekiq/version"
require "request_store/sidekiq/server_middleware"
require "request_store/sidekiq/railtie" if defined?(Rails::Railtie)

module RequestStore
  module Sidekiq
    def self.add_custom_middleware!
      ::Sidekiq.configure_server do |config|
        config.server_middleware do |chain|
          chain.add ServerMiddleware
        end
      end
    end
  end
end
