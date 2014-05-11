require "spec_helper"

feature "As User I can add categories" do

  background do
    @user = create(:user)
    @category = build(:category)
    login_as(@user, scope: :user)
    visit new_category_path
  end

  scenario "with valid data" do
    fill_in "category[name]", with: @category.name

    find_button("Create").click

    expect(@user.categories.where(name: @category.name)).to exist
    expect(@user.categories.count).to eql 6
  end

  scenario "with invalid data" do
    find_button("Create").click
    expect(@user.categories.count).to eql 5
  end
end
