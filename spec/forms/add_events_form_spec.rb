require 'fast_helper'
require 'active_model'
require_relative '../../app/forms/add_events_form'

describe AddEventsForm do
  let(:universe){ double }
  let(:article){ double }
  let(:form){ AddEventsForm.new article }
  before{ article.should_receive(:event_ids).and_return [1] }

  describe "#valid?" do
    subject{ form.valid? }

    context "success" do
      before{ form.should_receive(:universe_event_ids).and_return [1] }
      it{ should be true } 
    end

    context "failure" do
      before{ form.should_receive(:universe_event_ids).and_return [2] }
      it{ should be false } 
    end
  end
end
