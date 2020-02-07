require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    @challenge_1 = Challenge.create(theme: "Old Stuff", project_budget: 500)
    @project_1 = @challenge_1.projects.create(name: "Garbage", material: "trash")

    visit "/projects/#{@project_1.id}"
  end

  it "shows the projects name and material from project show page" do

    expect(page).to have_content(@challenge_1.theme)
    expect(page).to have_content(@project_1.name)
    expect(page).to have_content(@project_1.material)
  end
end

# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
