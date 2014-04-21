require 'spec_helper'

describe Chest do
  let(:user) { create(:user) }

  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
  end

  describe "#balance" do
    before(:each) do
      @chest = create(:chest)
      create_list :coin, 15, { chest: @chest }
    end

    it { expect(@chest.balance).to eql 15000.00 }
  end
end
