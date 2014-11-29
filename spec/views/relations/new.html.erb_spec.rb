require 'view_helper'

describe 'relations/new.html.erb' do
  let(:rendering){ Capybara.string rendered }
  let(:relation){ double :relation }
  let(:form){ double :form, relation:relation }
  let(:presenter){ double :presenter }
  before do
    view.should_receive(:present).and_yield presenter
    presenter.should_receive(:from_article_name){ "Dan Josefsson" }
    stub_template "relations/_form.html.erb" => "<form>form</form>"
    assign :form, form
    render
  end

  context "form div" do
    subject(:div){ rendering.find 'div.relation.form' }
    context "h3 title" do
      subject{ p rendered; div.find 'h3' }
      its(:text){ should eq "Dan Josefsson" }
    end
    context "form" do
      subject{ div.find 'form' }
      its(:text){ should eq "form" }
    end
  end

end
