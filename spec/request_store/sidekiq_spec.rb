require "spec_helper"

describe RequestStore::Sidekiq do
  it "has a version number" do
    expect(RequestStore::Sidekiq::VERSION).not_to be nil
  end

  describe '#insert_middleware' do
    subject { described_class }

    # Need to stub this out or we don't actually call #configure_server block
    before do
      allow(::Sidekiq).to receive(:server?).and_return(true)
    end

    it 'added our middleware to the server stack' do
      subject.add_custom_middleware!

      expect(::Sidekiq.server_middleware).to be_exists(RequestStore::Sidekiq::ServerMiddleware)
    end
  end
end
