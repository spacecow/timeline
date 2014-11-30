require 'spec_helper'

describe 'Event update' do
  let(:event){ create :event }
  let(:parent_event){ create :event, title:'Previous Event', universe:event.universe }

  before do
    parent_event
    visit universe_path(event.universe)
    visit edit_event_path(event)
    fill_in 'Title', with:title
    fill_in 'Description', with:'A description'
    select 'Previous Event', from:'Parent event'
    click_on 'Update'
  end

  context "success" do
    let(:title){ 'The Trident' }
    it{ page.should have_content 'Event updated' }

    describe 'updated event' do
      subject{ event.reload }
      its(:title){ should eq 'The Trident' }
      its(:description){ should eq 'A description' }
      its(:parent_event_id){ should be parent_event.id }
    end
  end

  context "failure" do
    let(:title){ '' }
    it{ page.should have_content "can't be blank" }
  end
end
