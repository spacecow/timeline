require 'view_helper'

describe 'events/show.html.erb' do
  let(:rendering){ Capybara.string rendered }
  let(:event){ double :event }
  let(:form){ double :from, event:event }
  before do
    assign :add_articles_form, form
    stub_template "events/_add_articles_form.html.erb" => "<form>form</form>"
    render
  end

  context "div" do
    subject(:div){ rendering.find 'div.event' }
    context "header" do
      subject{ div.find 'h3' }
      its(:text){ should eq 'The Slaughter' }
    end
    context "form" do
      subject{ div.find 'form' }
      its(:text){ should eq "form" }
    end
    context "actions" do
      subject(:ul){ div.find 'ul.actions' }
      context "edit action" do
        subject{ ul.find 'li.action.edit a' }
        its(:text){ should eq "Edit" }
        its([:href]){ should eq edit_event_path(event) }
      end
    end
  end
end
