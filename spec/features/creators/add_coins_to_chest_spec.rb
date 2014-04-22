require "spec_helper"

feature "Add positive coins to a chest" do
  let!(:user) { create(:user) }
  let!(:chest) { create(:chest, user: user) }

  background do
    login_as(user, scope: :user)
    visit new_chest_coin_path(chest)
  end

  scenario "Adds a one shot type coin to chest" do
    fill_in 'coin[value]', with: '1000'

    find_button("Create").click

    expect(chest.coins.where(value: 1000)).to exist
    expect(current_path).to eql chest_path(chest)
  end


end
