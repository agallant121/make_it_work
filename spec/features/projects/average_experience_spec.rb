# require 'rails_helper'
#
# RSpec.describe "As a visitor" do
#   before :each do
#     @challenge_1 = Challenge.create(theme: "Old Stuff", project_budget: 500)
#
#     @project_1 = @challenge_1.projects.create(name: "Garbage", material: "trash")
#
#     @alex = @project_1.contestants.create(name: "Alex", age: 31, hometown: "Bangor", years_of_experience: 10)
#     @abby = @project_1.contestants.create(name: "Abby", age: 32, hometown: "Yarmouth", years_of_experience: 8)
#     @aila = @project_1.contestants.create(name: "Aila", age: 30, hometown: "Denver", years_of_experience: 9)
#
#     visit "/projects/#{@project_1.id}"
#   end
#
#   it "shows the average years of experience for a project" do
#     within("#project-#{@project_1.id}") do
#       expect(page).to have_content("Average Years of Experience: 9")
#     end
#   end
# end
