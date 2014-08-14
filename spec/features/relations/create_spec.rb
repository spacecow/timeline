require 'spec_helper'

describe 'Relation create' do
  before do
    visit new_relation_path
  end

  context "success" do
    before{ click_on 'Create' }
    describe Relation do
      subject{ Relation }
      its(:count){ should be 1 }
    end
  end
end
