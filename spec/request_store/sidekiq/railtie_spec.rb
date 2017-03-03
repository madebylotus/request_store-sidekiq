require 'spec_helper'

RSpec.describe RequestStore::Sidekiq::Railtie do
  def load_rails_app!
    Combustion.initialize! :action_controller
  end

  it 'injects middleware when rails app is initialized' do
    expect(RequestStore::Sidekiq).to receive(:add_custom_middleware!)

    load_rails_app!
  end
end
