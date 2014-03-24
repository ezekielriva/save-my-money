require 'spec_helper'

feature "Chest creation" do
  let!(:user) { create(:user) }
  let!(:chest) { build(:chest) }

  background do
    login_as(user, scope: :user)
    visit new_chest_path
  end

  scenario "with valid data" do
    fill_in 'chest[name]',    with: chest.name

    find_button("Create").click

    expect(user.chests.where(name: chest.name)).to exist
  end

  scenario "with invalid data" do
    user = create(:user_with_chests, chests_count: 3)
    find_button('Create').click
    expect(user.chests.count).to eql 4
  end

end
