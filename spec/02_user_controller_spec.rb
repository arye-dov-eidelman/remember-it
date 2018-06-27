require_relative "spec_helper"

def app
  UserController
end


describe UserController do


  describe "sign up" do

    before do
      john = User.new(first_name: 'john', last_name: 'smith', email: 'johnsmith@gmail.com', password: 'p@sSw0rd')
    end

    it "/signup redirects to /account/signup" do
      visit '/signup'
      expect(page).to have_current_path('/account/signup')
    end

    
    it "/account/signup displays the sign up page" do
      visit '/account/signup'
      expect(page.status_code).to eq(200)
      expect(page).to have_title("Sign Up")
      expect(page).to have_text("First Name")
      expect(page).to have_field("First Name:")
      expect(page).to have_text("Last Name")
      expect(page).to have_field("Last Name")
      expect(page).to have_text("Email")
      expect(page).to have_field("Email", type: "email")
      expect(page).to have_text("Password")
      expect(page).to have_field("Password", type: "password")
      expect(page).to have_button("Sign Up", type: "submit")
    end
  end
  
  describe "login" do
    
    before do
      john = User.create(first_name: 'john', last_name: 'smith', email: 'johnsmith@gmail.com', password: 'p@sSw0rd')
    end
    
    # it "account/signup displays the login page" do
    #   visit '/account/signup'
    #   fill_in :first_name :with => john.first_name
    # end

    # it "Welcomes the user when logged in" do
    #   visit '/account/login'
    #   fill_in :email, :with => john.email
    #   fill_in :password, :with => 'password'
    #   click_button 'submit'
  
    #   expect(page.body).to include('welcome John')
    # end
  end

  describe "logout" do
    
    before do
      john = User.create(first_name: 'john', last_name: 'smith', email: 'johnsmith@gmail.com', password: 'p@sSw0rd')
    end

    # it "logs the user out" do
      
    #   visit '/account'
    #   expect(page.body).to include(john.first_name)
      
    #   click_link 'logout'
    #   expect(page.body).not_to include(john.first_name)
    #   expect(page.body).to include('Login')
    # end
  end
end
