require 'spec_helper'

describe EventPresenter do
  let(:event){ double :event, id:1 }
  let(:presenter){ EventPresenter.new event, view }
  let(:rendering){ Capybara.string function }

  describe "actions" do
    let(:function){ presenter.actions }
    subject(:actions){ rendering.find 'ul.actions' }
    its(:text){ should be_empty }
  end

end
