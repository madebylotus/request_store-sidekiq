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
      attr_accessor :restore

      def initialize
        @restore = false
      end
    end
  end
end
