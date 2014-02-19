require 'active_model'
require_relative '../../app/forms/token_form'
require_relative '../../app/forms/add_events_form'

describe AddEventsForm do
  let(:article){ double id:1, event_ids:[1], universe_event_ids:universe_event_ids }
  let(:form){ AddEventsForm.new article }

  describe "#valid?" do
    before{ form.valid? }
    subject{ form.errors.messages }

    context "success" do
      let(:universe_event_ids){ [1] }
      it{ should be_empty }
    end

    context "failure" do
      let(:universe_event_ids){ [2] }
      its([:event_tokens]){ should eq ["wrong universe"] }
    end
  end
end
