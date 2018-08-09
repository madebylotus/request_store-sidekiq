require "request_store"
require "sidekiq"

require "request_store/sidekiq/version"
require "request_store/sidekiq/configuration"
require "request_store/sidekiq/client_middleware"
require "request_store/sidekiq/server_middleware"
require "request_store/sidekiq/railtie" if defined?(Rails::Railtie)

module RequestStore
  module Sidekiq
    def self.add_custom_middleware!
      ::Sidekiq.configure_client do |config|
        config.client_middleware do |chain|
          chain.add ::RequestStore::Sidekiq::ClientMiddleware
        end
      end

      ::Sidekiq.configure_server do |config|
        config.client_middleware do |chain|
          chain.add ::RequestStore::Sidekiq::ClientMiddleware
        end

        config.server_middleware do |chain|
          if defined?(::Sidekiq::Batch::Server)
            chain.insert_before(
              ::Sidekiq::Batch::Server,
              ::RequestStore::Sidekiq::ServerMiddleware
            )
          else
            chain.add ::RequestStore::Sidekiq::ServerMiddleware
          end
        end
      end
    end
  end
end
