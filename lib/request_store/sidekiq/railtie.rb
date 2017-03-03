module RequestStore
  module Sidekiq
    class Railtie < ::Rails::Railtie
      initializer 'request_store-sidekiq.insert_middleware' do |app|
        Sidekiq.insert_middleware
      end
    end
  end
end
