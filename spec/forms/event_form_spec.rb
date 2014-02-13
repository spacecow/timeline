require 'fast_helper'
require 'active_model'
require_relative '../../app/forms/event_form'

describe EventForm do
  let(:event){ double title:title }
  let(:form){ EventForm.new event }

  describe "#valid?" do
    let(:title){ "Cressen" }
    subject{ form.valid? }
    it{ should be true } 

    context "title is blank" do
      let(:title){ "" }
      it{ should be false }
    end
  end
end
