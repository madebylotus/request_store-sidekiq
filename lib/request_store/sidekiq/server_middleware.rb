module RequestStore
  module Sidekiq
    class ServerMiddleware
      def call(_worker, job, _queue)
        if restore_request_store?(job)
          ::RequestStore.store.merge!(job['request_store'])
        end

        yield
      ensure
        ::RequestStore.clear!
      end

      def restore_request_store?(job)
        ::RequestStore::Sidekiq.configuration.restore &&
          job['request_store'].present?
      end
    end
  end
end
