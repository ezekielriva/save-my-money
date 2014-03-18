require "spec_helper"

feature "User sign up" do
  let!(:user) { build(:user) }

  scenario "with valid data" do
    visit '/signup'

    fill_in 'user[email]',                    with: user.email
    fill_in 'user[password]',                 with: user.password
    fill_in 'user[password_confirmation]',    with: user.password

    find_button("Sign up").click

    expect(User.where(email: user.email)).to exist
    expect(page).to have_content("Welcome#index")
  end

  scenario "with invalid data" do
    visit '/signup'

    find_button("Sign up").click

    expect(User.all).to be_empty
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end
end

