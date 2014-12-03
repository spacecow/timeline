require 'view_helper'
require 'capybara'

describe 'articles/_actions.html.erb' do
  let(:article){ double :article, id:666 }
  let(:filepath){ File.expand_path('../../../../app/views/articles/_actions.html.erb', __FILE__) }
  let(:locals){{ article:article }}

  before{ render file:filepath, locals:locals }

  subject(:doc){ Capybara.string rendered }

  describe "first action" do
    subject{ doc.find 'li.action a' }
    its(:text){ should eq 'Add Relation' }
    its([:href]){ should eq "/relations/new?from_article_id=666" }
  end
end

