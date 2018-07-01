require_relative "../spec_helper"

def app
  CurriculumController
end

describe CurriculumController do

before do
  @john = User.create(first_name: 'john', last_name: 'smith', email: 'johnsmith@gmail.com', password: 'p@sSw0rd')
  visit '/account/login'
  fill_in "Email:", with: @john.email
  fill_in "Password", with: @john.password
  click_button "Log In"
end

  it "displays the curriculum editer" do
    visit '/curriculum'
    expect(page.status_code).to eq(200)
    expect(page).to have_title("Curriculum")
  end

  it "displays the page when there are no tracks" do
    visit '/curriculum'
    expect(page).to have_text("You haven't created any Learning tracks yet.")
    expect(page).to have_link("Create a new Learning Track")
  end

  # it "displays the page when there are tracks" do
  #   visit '/curriculum'
  #   expect(page).not_to have_text("You haven't created any Learning tracks yet.")
  #   expect(page).to have_link("Create a new Learning Track")
  # end
end
