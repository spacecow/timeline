require 'spec_helper'

describe 'relations/new.html.erb' do
  let(:rendering){ Capybara.string rendered }
  let(:relation){ Relation.new }
  let(:form){ RelationForm.new relation }
  before do
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
