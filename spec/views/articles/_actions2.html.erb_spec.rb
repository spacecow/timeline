require 'view_helper'
require 'capybara'

module Helper
  def new_relation_path attrs
    "/relations/new?from_article_id=666"
  end
  def link_to lbl, path
    "<a href=\"#{path}\">#{lbl}</a>"
  end
end

describe 'articles/_actions.html.erb' do
  let(:article){ double :article, id:666 }

  let(:locals){ {article:article} }
  let(:local_bindings){ ErbBinding.new(locals).extend(Helper).instance_eval{binding} }
  let(:filepath){ File.expand_path('../../../../app/views/articles/_actions.html.erb', __FILE__) }
  let(:erb){ ERB.new File.read(filepath) }
  let(:rendered){ erb.result local_bindings }

  subject(:doc){ Capybara.string rendered }

  describe "first action" do
    subject{ doc.find 'li.action a' }
    its(:text){ should eq 'Add Relation' }
    its([:href]){ should eq "/relations/new?from_article_id=666" }
  end
end

