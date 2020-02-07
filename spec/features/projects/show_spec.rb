require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    @challenge_1 = Challenge.create(theme: "Old Stuff", project_budget: 500)
    @challenge_2 = Challenge.create(theme: "Auto", project_budget: 1000)
    @challenge_3 = Challenge.create(theme: "House", project_budget: 1500)

    @project_1 = @challenge_1.projects.create(name: "Garbage", material: "trash")
    @project_2 = @challenge_2.projects.create(name: "Cars", material: "tires")
    @project_3 = @challenge_3.projects.create(name: "Linens", material: "sheets")

    @alex = @project_1.contestants.create(name: "Alex", age: 31, hometown: "Bangor", years_of_experience: 10)
    @abby = @project_2.contestants.create(name: "Abby", age: 32, hometown: "Yarmouth", years_of_experience: 8)
    @aila = @project_3.contestants.create(name: "Aila", age: 30, hometown: "Denver", years_of_experience: 9)

    visit "/projects/#{@project_1.id}"
  end

  it "shows the projects name and material from project show page" do

    expect(page).to have_content(@challenge_1.theme)
    expect(page).to have_content(@project_1.name)
    expect(page).to have_content(@project_1.material)
  end

  it "shows the number of contestants on each project" do
    within("#project-#{@project_1.id}") do
      expect(page).to have_content(1)
    end
  end
end

# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
