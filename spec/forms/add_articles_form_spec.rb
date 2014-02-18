require 'active_model'
require_relative '../../app/forms/add_articles_form'

describe AddArticlesForm do
  let(:event){ double }
  let(:form){ AddArticlesForm.new event }
  before{ event.should_receive(:article_ids).and_return [1] }

  describe "#valid?" do
    before{ form.should_receive(:universe_ids).and_return universe_ids
            form.valid? }
    subject{ form.errors.messages }

    context "success" do
      let(:universe_ids){ [1] }
      it{ should be_empty }
    end

    context "article must be in the same universe" do
      let(:universe_ids){ [2] }
      its([:article_tokens]){ should eq ["wrong universe"] }
    end
  end
end
