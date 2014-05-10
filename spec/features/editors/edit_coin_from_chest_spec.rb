require "spec_helper"

feature "Edit coin from chest" do
  background do
    @user   = create(:user)
    @chest  = create(:chest, user: @user)
    @coin   = create(:coin, chest: @chest, user: @user, category: @user.categories.last)
    login_as(@user, scope: :user)
    visit edit_chest_coin_path(@chest, @coin)
  end

  scenario "it changes value" do
    fill_in 'coin[value]', with: '10'

    find_button("Edit").click
    expect(@chest.coins.where(value: 10)).to exist
    expect(current_path).to eql chest_path(@chest)
  end

  scenario "it changes by invalid value" do
    fill_in 'coin[value]', with: ''

    find_button('Edit').click
    expect(page).to have_content "Value can't be blank"
  end


end
