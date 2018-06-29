require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do

  it "server is running" do
    visit '/'
    expect(page.status_code).to eq(200)
  end

  it "displays the home page" do
    visit '/'
    expect(page).to have_title("Remember It")
    expect(page).to have_text("Remember it")
    expect(page).to have_link("Learn")
    expect(page).to have_link("Curriculum")
  end
end
