begin
  require "byebug"
rescue LoadError
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "combustion"
require "request_store/sidekiq"
