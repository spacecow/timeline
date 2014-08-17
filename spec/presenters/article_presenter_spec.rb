require 'spec_helper'

describe ArticlePresenter do
  let(:article){ double :article, id:1 }
  let(:presenter){ ArticlePresenter.new article, view }
  let(:rendering){ Capybara.string function }

  describe "#actions" do
    let(:function){ presenter.actions }
    subject(:actions){ rendering.find 'ul.actions' }
    describe "first action" do
      subject{ actions.find 'li.action a' }
      its(:text){ should eq 'Add Relation' }
      its([:href]){ should eq new_relation_path(from_article_id:article.id) }
    end
  end

end
