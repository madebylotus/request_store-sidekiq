require "spec_helper"

describe RequestStore::Sidekiq do
  it "has a version number" do
    expect(RequestStore::Sidekiq::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
