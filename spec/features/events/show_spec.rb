require 'spec_helper'

describe 'Event show' do
  let(:event){ create :event }
  let(:path){ event_path event }

  before do
    visit universe_path(event.universe)
    visit path
  end

  context "there are no relations between events" do
    it{ page.should_not have_text "Add Relation" }
  end
end
