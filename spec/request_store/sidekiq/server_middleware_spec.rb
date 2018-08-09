require 'spec_helper'

RSpec.describe RequestStore::Sidekiq::ServerMiddleware do
  let(:worker) { class_double('Worker') }
  let(:job)    { {} }
  let(:queue)  { 'default' }
  let(:store)  { { a: 1 } }

  shared_examples 'a cleared request store' do
    it 'clears the request store' do
      expect(::RequestStore).to receive(:clear!)

      subject.call(worker, job, queue) {}
    end
  end

  shared_examples 'a persisted request store' do
    before do
      # ClientMiddleware setup the store.
      job['request_store'] = store
    end

    context 'when persistance is enabled' do
      before do
        ::RequestStore::Sidekiq.configure { |config| config.persist = true }
      end

      after do
        ::RequestStore::Sidekiq.configure { |config| config.persist = false }
      end

      it 'restores the request store' do
        subject.call(worker, job, queue) do
          expect(::RequestStore.store).to eq(store)
        end
      end
    end

    context 'when persistance is disabled' do
      it 'do not restores the request store' do
        subject.call(worker, job, queue) do
          expect(::RequestStore.store).to eq({})
        end
      end
    end
  end

  context 'when the worker raises an error' do
    before do
      allow_any_instance_of(worker).to(
        receive(:perform)
          .and_raise(ArgumentError)
      )
    end

    it_behaves_like 'a cleared request store'
    it_behaves_like 'a persisted request store'
  end

  context 'when the worker completes successfully' do
    before do
      allow_any_instance_of(worker).to(
        receive(:perform)
          .and_return(true)
      )
    end

    it_behaves_like 'a cleared request store'
    it_behaves_like 'a persisted request store'
  end
end
