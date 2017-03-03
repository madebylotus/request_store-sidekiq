require 'spec_helper'

RSpec.describe RequestStore::Sidekiq::ServerMiddleware do
  let(:worker)  { class_double('Worker') }
  let(:job)     { Hash.new }
  let(:queue)   { 'default' }

  shared_examples 'a cleared request store' do
    it 'clears the request store' do
      expect(::RequestStore).to receive(:clear!)

      subject.call(worker, job, queue) {}
    end
  end

  context 'when the worker raises an error' do
    before do
      allow_any_instance_of(worker).to receive(:perform).and_raise(ArgumentError)
    end

    it_behaves_like 'a cleared request store'
  end

  context 'when the worker completes successfully' do
    before do
      allow_any_instance_of(worker).to receive(:perform).and_return(true)
    end

    it_behaves_like 'a cleared request store'
  end
end
