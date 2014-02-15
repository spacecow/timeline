require 'fast_helper'
require 'active_model'
require_relative '../../app/forms/article_form'

describe ArticleForm do
  let(:article){ double name:name }
  let(:form){ ArticleForm.new article }

  describe "#valid?" do
    let(:name){ "Cressen" }
    let(:image_error){ nil }
    before do
      form.should_receive(:image_integrity_error).and_return image_error
      form.valid?
    end
    subject{ form.errors.messages }
    it{ should be_empty } 

    context "name is blank" do
      let(:name){ "" }
      its([:name]){ should eq ["can't be blank"] }
    end

    context "attached file is of wrong file format" do
      let(:image_error){ double message:'file extension error' }
      its([:image]){ should eq ["file extension error"] }
    end
  end
end
