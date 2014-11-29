require 'view_helper'

describe 'articles/show.html.erb' do
  let(:rendering){ Capybara.string rendered }
  let(:form){ double :form, article:article }
  let(:article){ double :article }
  let(:presenter){ double :presenter }
  before do
    assign :add_events_form, form
    view.should_receive(:present).and_yield presenter
    presenter.should_receive(:name){ 'Tarzan' }
    stub_template "articles/_add_events_form.html.erb" => "<form>form</form>"
    stub_template "articles/_actions.html.erb" => "<ul>actions</ul>"
    render
  end

  context "div" do
    subject(:div){ rendering.find 'div.article' }
    context "header" do
      subject{ div.find 'h3' }
      its(:text){ should eq 'Tarzan' }
    end 
    context "form" do
      subject{ div.find 'form' }
      its(:text){ should eq "form" }
    end
    context "ul" do
      subject{ div.find 'ul' }
      its(:text){ should eq "actions" }
    end
  end

end
