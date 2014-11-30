require 'fast_helper'
require 'active_model'
require 'carrierwave'
require_relative '../../app/uploaders/image_uploader'
require_relative '../../app/forms/event_form'

describe EventForm do
  let(:event){ double title:title, parent_event_id:666 }
  let(:form){ EventForm.new event }

  describe "#valid?" do
    let(:title){ "Cressen" }
    let(:event_titles){ [] }
    let(:image_error){ nil }
    before do
      form.should_receive(:event_titles).with(oneself:false).once.and_return event_titles
      form.should_receive(:image_integrity_error).and_return image_error
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

    context "attached file is of wrong file format" do
      let(:image_error){ double message:'file extension error' }
      its([:image]){ should eq ["file extension error"] }
    end
  end
end
