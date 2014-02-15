require 'fast_helper'
require 'active_model'
require_relative '../../app/forms/event_form'

describe EventForm do
  let(:event){ double title:title }
  let(:form){ EventForm.new event }

  describe "#valid?" do
    let(:title){ "Cressen" }
    let(:event_titles){ [] }
    before{ form.should_receive(:event_titles).and_return event_titles }
    subject{ form.valid? }
    it{ should be true } 

    context "title is blank" do
      let(:title){ "" }
      it{ should be false }
    end

    context "title is a duplicate" do
      let(:event_titles){ [title] }
      it{ should be false }
    end
  end
end
