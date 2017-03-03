module RequestStore
  module Sidekiq
    class ServerMiddleware
      def call(worker, job, queue)
        yield
      ensure
        ::RequestStore.clear!
      end
    end
  end
end
