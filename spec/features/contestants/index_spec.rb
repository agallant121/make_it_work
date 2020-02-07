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

    visit "/contestants"
  end

    it "shows the names and projects for each contestant on index page" do
      within("#contestant-#{@alex.id}") do
        expect(page).to have_content(@alex.name)
        expect(page).to have_content(@project_1.name)
      end

      within("#contestant-#{@abby.id}") do
        expect(page).to have_content(@abby.name)
        expect(page).to have_content(@project_2.name)
      end

      within("#contestant-#{@aila.id}") do
        expect(page).to have_content(@aila.name)
        expect(page).to have_content(@project_3.name)
      end
    end
  end

# When I visit the contestants index page ("/contestants")
# I see a list of names of all the contestants
# And under each contestants name I see a list of the projects (names) that they've been on
#
# (e.g.   Kentaro Kameyama
#         Projects: Litfit, Rug Tuxedo
#
#         Jay McCarroll
#         Projects: LeatherFeather)
