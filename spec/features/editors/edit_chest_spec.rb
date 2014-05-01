require "spec_helper"

feature "Edit chest" do
  let!(:user) { create(:user) }
  let!(:chest) { create(:chest, user: user) }

  background do
    login_as(user, scope: :user)
    visit edit_chest_path(chest)
  end

  scenario "Changes name" do
    fill_in 'chest[name]',    with: 'Bank'

    find_button("Edit").click

    expect(user.chests.where(name: 'Bank')).to exist
  end

  scenario "Empty a value" do
    fill_in 'chest[name]', with: ''

    find_button('Edit').click
    expect(page).to have_content "Name can't be blank"
  end


end
