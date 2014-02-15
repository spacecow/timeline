require 'spec_helper'

describe 'layouts/_header.html.erb' do
  let(:rendering){ Capybara.string rendered }
  before{ view.should_receive(:current_universe?).twice.and_return universe
          render 'header' }
  subject(:ul){ rendering.find 'ul' }

  describe "Universes link" do
    let(:universe){ nil }
    subject{ ul.find 'li.universes a' }
    its([:href]){ should eq universes_path }
  end
  describe "Articles link" do
    let(:universe){ true }
    subject{ ul.find 'li.articles a' }
    its([:href]){ should eq articles_path }
  end
  describe "Events link" do
    let(:universe){ true }
    subject{ ul.find 'li.events a' }
    its([:href]){ should eq events_path }
  end
end
