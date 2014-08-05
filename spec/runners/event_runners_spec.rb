require 'fast_helper'
require './app/runners/event_runners'

module EventRunners
  describe EventRunners do
    let(:context){ double :context, repo:repo }
    let(:repo){ double :repo }
    let(:callback){ lambda { |on|
      on.success { |*args| [:success, *args] }
      on.failure { |*args| [:failure, *args] }}}
    let(:event){ double :event }
    let(:runner){ runner_class.new(context, &callback) }
    subject{ function }

    describe Index do
      let(:runner_class){ Index }
      let(:function){ runner.run }
      before{ repo.should_receive(:find_all_events){ [event] }}
      it{ should eq [event] }
    end

    describe Create do
      let(:runner_class){ Create }
      let(:function){ runner.run params }
      let(:params){ {} }

      before do
        repo.should_receive(:new_event).with(params){ event }
        repo.should_receive(:save_event).with(event){ save }
      end

      context "success" do
        let(:save){ true }
        it{ should eq [:success] }
      end

      context "failure" do
        let(:save){ false }
        it{ should eq [:failure, event] }
      end
    end

    describe New do
      let(:runner_class){ New }
      let(:function){ runner.run }
      before{ repo.should_receive(:new_event){ event }}
      it{ should eq event }
    end
  end
end
