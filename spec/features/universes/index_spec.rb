require 'spec_helper'

describe "Universe index" do
  let!(:universe){ create :universe, title:'A Song of Ice and Fire' }
  before{ visit universes_path }

  it "select a universe" do
    click_on 'A Song of Ice and Fire'
    current_path.should eq universes_path
  end
end
