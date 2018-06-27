require_relative "spec_helper"

def app
  UserController
end

describe UserController do
  it "/signup redirects to the signup page" do
    get '/signup'
    expect(last_response.status).to eq(302)
    follow_redirect!
    # binding.pry
    # expect(last_response.location).to include("account")
    expect(last_response.body).to include("Sign Up")
  end
  
  it "account/signup displays the sign up page" do
    get '/account/signup'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Sign Up")
    expect(last_response.body).to include("First Name")
    expect(last_response.body).to include("Last Name")
    expect(last_response.body).to include("Email")
    expect(last_response.body).to include("Password")
    expect(last_response.body).to include("submit")
  end

  # it "account/signup displays the login page" do
  #   get '/account/signup'
  #   fill_in :first_name with 'mendy'
  # end
end
