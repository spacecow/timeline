require 'active_model'
require_relative '../../app/forms/add_articles_form'

describe AddArticlesForm do
  let(:event){ double id:1, article_ids:[1], universe_article_ids:universe_article_ids }
  let(:form){ AddArticlesForm.new event }

  describe "#valid?" do
    before{ form.valid? }
    subject{ form.errors.messages }

    context "success" do
      let(:universe_article_ids){ [1] }
      it{ should be_empty }
    end

    context "article must be in the same universe" do
      let(:universe_article_ids){ [2] }
      its([:article_tokens]){ should eq ["wrong universe"] }
    end
  end
end
