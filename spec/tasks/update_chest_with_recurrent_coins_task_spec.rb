require "spec_helper"

describe "recurrent_coins:update_chests" do
  include_context "rake"

  its(:prerequisites) { should include("environment") }

  before(:each) do
    @chest = create :chest
    create_list :coin, 5, chest: @chest
    DateTime.stub(:now).and_return(Date.today)
  end

  it "should update all chest with recurrent coins" do
    recurrent = create :recurrent_coin, chest: @chest
    subject.invoke
    expect(@chest.coins.count).to eql 7
    expect(@chest.coins.where(parent_id: recurrent.id)).to exist
    recurrent.reload
    expect(recurrent.updated_at.to_date).to eql Date.today
  end

  it "should update all chest with recurrent coins until date" do
    @until = create :repeat_until_today, chest: @chest
    subject.invoke
    expect(@chest.coins.count).to eql 6
  end
end
