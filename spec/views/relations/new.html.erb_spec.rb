require 'spec_helper'

describe 'relations/new.html.erb' do
  let(:rendering){ Capybara.string rendered }
  let(:relation){ Relation.new }
  let(:form){ RelationForm.new relation }
  let(:presenter){ double :presenter }
  before do
    view.should_receive(:present).and_yield presenter
    presenter.should_receive(:from_article_name){ "Dan Josefsson" }
    
    assign :form, form
    render
  end

  context "form div" do
    subject(:div){ rendering.find 'div.relation.form' }
    context "h3 title" do
      subject{ div.find 'h3' }
      its(:text){ should eq "Dan Josefsson" }
    end
  end
end
