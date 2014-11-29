require 'view_helper'

describe 'articles/_actions.html.erb' do
  let(:rendering){ Capybara.string rendered }
  let(:article){ double :article, id:666 }
  before do
    render template:'articles/_actions.html.erb', locals:{article:article}
  end
  subject(:actions){ rendering.find 'ul.actions' }

  describe "first action" do
    subject{ actions.find 'li.action a' }
    its(:text){ should eq 'Add Relation' }
    its([:href]){ should eq new_relation_path(from_article_id:article.id) }
  end
end
