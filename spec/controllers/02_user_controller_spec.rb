require_relative "../spec_helper"

def app
  UserController
end

describe UserController do

  describe "sign up" do

    before do
      @john = User.new(first_name: 'john', last_name: 'smith', email: 'johnsmith@gmail.com', password: 'p@sSw0rd')
    end

    it "/signup redirects to /account/signup" do
      visit '/signup'
      expect(page).to have_current_path('/account/signup')
    end

    it "Displays the sign up page" do
      visit '/account/signup'
      expect(page.status_code).to eq(200)
      expect(page).to have_title("Sign up")
      expect(page).to have_text("First Name")
      expect(page).to have_field("First Name:")
      expect(page).to have_text("Last Name")
      expect(page).to have_field("Last Name")
      expect(page).to have_text("Email")
      expect(page).to have_field("Email", type: "email")
      expect(page).to have_text("Password")
      expect(page).to have_field("Password", type: "password")
      expect(page).to have_button("Sign up", type: "submit")
    end

    it "Can Sign up a user" do
      visit '/account/signup'
      fill_in "First Name:", with: @john.first_name
      fill_in "Last Name:", with: @john.last_name
      fill_in "Email:", with: @john.email
      fill_in "Password", with: @john.password
      click_button "Sign up"
      saved_user = User.find_by(email: @john.email)

      expect(page).to have_text("Welcome #{@john.full_name}")
      expect(saved_user.first_name).to eq(@john.first_name)
      expect(saved_user.last_name).to eq(@john.last_name)
      expect(saved_user.email).to eq(@john.email)
    end
  end
  
  describe "login" do

    before do
      @john = User.create(first_name: 'john', last_name: 'smith', email: 'johnsmith@gmail.com', password: 'p@sSw0rd')
    end

    it "/login redirects to /account/login" do
      visit '/login'
      expect(page).to have_current_path('/account/login')
    end

    it "Displays the log in page" do
      visit '/account/login'
      expect(page.status_code).to eq(200)
      expect(page).to have_title("Log in")
      expect(page).to have_text("Email")
      expect(page).to have_field("Email", type: "email")
      expect(page).to have_text("Password")
      expect(page).to have_field("Password", type: "password")
      expect(page).to have_button("Log in", type: "submit")
    end

    it "Can log in a user" do
      visit '/account/login'
      fill_in "Email:", with: @john.email
      fill_in "Password", with: @john.password
      click_button "Log in"

      expect(page).to have_text("Welcome #{@john.full_name}")
      expect(page).to have_link("#{@john.first_name}")
    end
  end

  describe "logout" do

    before do
      @john = User.create(first_name: 'john', last_name: 'smith', email: 'johnsmith@gmail.com', password: 'p@sSw0rd')
      # login do
        visit '/account/login'
        fill_in "Email:", with: @john.email
        fill_in "Password", with: @john.password
        click_button "Log in"
      # end
    end

    it "logs the user out" do
      visit '/'
      click_link 'Log out'
      expect(page).not_to have_text(@john.first_name)
      expect(page).to have_text("You've successfully logged out")
      expect(page).to have_text('Log in')
    end
  end
end
