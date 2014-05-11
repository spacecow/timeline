alias require_dependency require

require_relative '../../app/runners/create_runner'

describe CreateRunner do
  let(:event){ double :event }
  let(:repo){ double :repo, new_event:event, save_event:save }
  let(:context){ double :context, repo:repo }
  let(:runner){ CreateRunner.new context }
  let(:event_attrs){ {name:'Johan'} }
  let(:function){ runner.run event_attrs }

  describe "successful" do
    let(:save){ true }
    before{ context.should_receive(:create_successful).with("Event created") }
    it("seems to work"){ function }
  end

  describe "successful" do
    let(:save){ false }
    before{ context.should_receive(:create_failed).with(event) }
    it("seems to work"){ function }
  end
end
