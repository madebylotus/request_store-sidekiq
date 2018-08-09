# Engine configuration.
module RequestStore
  module Sidekiq
    class << self
      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end
    end

    # Configuration variables and defaults.
    class Configuration
      attr_accessor :persist

      def initialize
        @persist = false
      end
    end
  end
end
