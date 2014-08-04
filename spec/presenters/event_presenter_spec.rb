require 'spec_helper'

describe EventPresenter do
  let(:event){ double :event, id:1 }
  let(:presenter){ EventPresenter.new event, view }
  let(:rendering){ Capybara.string function }

  describe "actions" do
    let(:function){ presenter.actions }
    subject(:actions){ rendering.find 'ul.actions' }
    describe "first action" do
      subject{ actions.find 'li.action a' }
      its(:text){ should eq 'Add Relation' }
      its([:href]){ should eq new_event_relation_path(event.id) }
    end
  end

end
