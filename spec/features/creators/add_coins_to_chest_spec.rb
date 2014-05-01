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
    select user.categories.first.name, from: 'coin[category_id]'

    find_button("Create").click

    expect(chest.coins.where(value: 1000)).to exist
    expect(user.categories.first.coins.where(value: 1000)).to exist
    expect(current_path).to eql chest_path(chest)
  end

  scenario "Adds a periodic type coin to chest" do
    fill_in 'coin[value]', with: '1000'
    check 'coin[is_recurrent]'
    select user.categories.first.name, from: 'coin[category_id]'

    find_button("Create").click

    expect(chest.coins.where(value: 1000, is_recurrent: true)).to exist
    expect(user.categories.first.coins.where(value: 1000, is_recurrent: true)).to exist
    expect(current_path).to eql chest_path(chest)
  end

  scenario "Adds an invalid coin" do
    find_button('Create').click
    expect(page).to have_content "Value can't be blank"
  end


end
