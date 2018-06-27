require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do

  it "server is running" do
    visit '/'
    expect(page.status_code).to eq(200)
    expect(page.body).to include("Remember it")
  end

  it "displays the home page" do
    visit '/'
    expect(page).to have_link("/learn")
    expect(page).to have_link("/curriculum")
  end
end
