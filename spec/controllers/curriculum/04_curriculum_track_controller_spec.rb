require_relative "../../spec_helper"

def app
  CurriculumTrackController
end

describe CurriculumTrackController do

  before do
    @john = User.create(first_name: 'john', last_name: 'smith', email: 'johnsmith@gmail.com', password: 'p@sSw0rd')
    visit '/account/login'
    fill_in "Email:", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log In"
  end

  it "displays the new track page" do
    visit '/tracks/new'
    expect(page).to have_text("Create a New Learning Track")
  end
end
