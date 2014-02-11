require 'fast_helper'
require 'active_model'
require_relative '../../app/forms/event_form'

describe EventForm do
  let(:form){ EventForm.new universe_id, title:title }

  describe "#valid?" do
    let(:universe_id){ 1 }
    let(:title){ "Cressen" }
    subject{ form.valid? }
    it{ should be true } 

    context "title is blank" do
      let(:title){ "" }
      it{ should be false }
    end

    context "universe is blank" do
      let(:universe_id){ "" }
      it{ should be false }
    end
  end
end
