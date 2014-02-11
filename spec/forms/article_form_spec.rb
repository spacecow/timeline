require 'fast_helper'
require 'active_model'
require_relative '../../app/forms/article_form'

describe ArticleForm do
  let(:form){ ArticleForm.new universe_id, name:name }

  describe "#valid?" do
    let(:universe_id){ 1 }
    let(:name){ "Cressen" }
    subject{ form.valid? }
    it{ should be true } 

    context "name is blank" do
      let(:name){ "" }
      it{ should be false }
    end

    context "universe is blank" do
      let(:universe_id){ "" }
      it{ should be false }
    end
  end
end
