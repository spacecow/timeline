require 'fast_helper'
require 'active_model'
require_relative '../../app/forms/event_form'

describe EventForm do
  let(:event){ double title:title }
  let(:form){ EventForm.new event }

  describe "#valid?" do
    let(:title){ "Cressen" }
    let(:event_titles){ [] }
    before do
      form.should_receive(:event_titles).and_return event_titles
      form.valid?
    end
    subject{ form.errors.messages }
    it{ should be_empty } 

    context "title is blank" do
      let(:title){ "" }
      its([:title]){ should eq ["can't be blank"] }
    end

    context "title is duplicated" do
      let(:event_titles){ [title] }
      its([:title]){ should eq ["has already been taken"] }
    end
  end
end
