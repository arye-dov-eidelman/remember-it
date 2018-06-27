require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "displays the home page when logged out" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Remember it")
    expect(last_response.body).to include("/l")
    expect(last_response.body).to include("/c")
    expect(last_response.body).to include("/account/login")
    expect(last_response.body).to include("/account/signup")
  end
end
