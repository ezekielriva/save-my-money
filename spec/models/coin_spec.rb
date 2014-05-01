require 'spec_helper'

describe Coin do
  describe "#from_recurrent" do
    before(:each) do
      @coin = create(:coin)
      @coin.should_receive(:parent).and_return( build(:coin) )
    end

    it { expect(@coin.from_recurrent).to be_true }
  end
end
