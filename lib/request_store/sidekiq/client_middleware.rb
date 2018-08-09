module RequestStore
  module Sidekiq
    class ClientMiddleware
      def call(_worker_class, item, _queue, _redis_pool = nil)
        if store_request_store?(item)
          item['request_store'] = ::RequestStore.store
        end

        yield
      end

      def store_request_store?(item)
        ::RequestStore::Sidekiq.configuration.restore &&
          item['request_store'].blank?
      end
    end
  end
end
