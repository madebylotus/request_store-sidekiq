$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "sidekiq/testing"
require "request_store/sidekiq"

begin
  require "byebug"
rescue LoadError
end
