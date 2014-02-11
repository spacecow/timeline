require 'fast_helper'
require 'active_model'
require_relative '../../app/forms/article_form'

describe ArticleForm do
  let(:form){ ArticleForm.new name:name }

  describe "#valid?" do
    let(:name){ "Cressen" }
    subject{ form.valid? }
    it{ should be true } 

    context "name is blank" do
      let(:name){ "" }
      it{ should be false }
    end
  end
end
