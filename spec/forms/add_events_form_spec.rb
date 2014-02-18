require 'active_model'
require_relative '../../app/forms/add_events_form'

describe AddEventsForm do
  let(:article){ double }
  let(:form){ AddEventsForm.new article }
  before{ article.should_receive(:event_ids).and_return [1] }

  describe "#valid?" do
    before{ form.should_receive(:universe_ids).and_return universe_ids 
            form.valid? }
    subject{ form.errors.messages }

    context "success" do
      let(:universe_ids){ [1] }
      it{ should be_empty } 
    end

    context "failure" do
      let(:universe_ids){ [2] }
      its([:event_tokens]){ should eq ["wrong universe"] }
    end
  end
end
