require 'spec_helper'

describe 'Event show' do
  let(:event){ create :event } 
  let(:path){ event_path event }

  before do
    visit universe_path(event.universe)
    visit path
  end

  context "navigate to new relation" do
    before{ click_link 'Add Relation' }
    it{ current_path.should eq new_event_relation_path(event) }
  end
end
