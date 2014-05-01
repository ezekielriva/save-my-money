require "spec_helper"

feature "Edit coin from chest" do
  let!(:user) { create(:user) }
  let!(:chest) { create(:chest, user: user) }
  let!(:coin) { create(:coin, chest: chest, user: user) }

  background do
    login_as(user, scope: :user)
    visit edit_chest_coin_path(chest, coin)
  end

  scenario "Changes value" do
    fill_in 'coin[value]', with: '10'

    find_button("Edit").click

    expect(chest.coins.where(value: 10)).to exist
    expect(current_path).to eql chest_path(chest)
  end

  scenario "Edit an invalid coin" do
    fill_in 'coin[value]', with: ''

    find_button('Edit').click
    expect(page).to have_content "Value can't be blank"
  end


end
