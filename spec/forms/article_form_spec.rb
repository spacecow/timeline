require 'fast_helper'
require 'active_model'
require 'carrierwave' 
require_relative '../../app/uploaders/image_uploader'
require_relative '../../app/forms/article_form'

describe ArticleForm do
  let(:article){ double name:name, type:type }
  let(:form){ ArticleForm.new article }

  describe "#valid?" do
    let(:name){ "Cressen" }
    let(:image_error){ nil }
    let(:article_names){ [] }
    let(:type){ "Character" }
    before do
      form.should_receive(:article_names).and_return article_names
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

    context "title is duplicated" do
      let(:article_names){ [name] }
      its([:name]){ should eq ["has already been taken"] }
    end

    context "type must be of one of predefined types" do
      let(:type){ ["Yeah"] }
      its([:type]){ should eq ["is not included in the list"] }
    end
  end
end
