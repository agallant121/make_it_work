require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "model methods" do
    it "should count contestants per project" do
       challenge_1 = Challenge.create(theme: "Old Stuff", project_budget: 500)
       challenge_2 = Challenge.create(theme: "Auto", project_budget: 1000)
       challenge_3 = Challenge.create(theme: "House", project_budget: 1500)

       project_1 = challenge_1.projects.create(name: "Garbage", material: "trash")
       project_2 = challenge_2.projects.create(name: "Cars", material: "tires")
       project_3 = challenge_3.projects.create(name: "Linens", material: "sheets")

       alex = project_1.contestants.create(name: "Alex", age: 31, hometown: "Bangor", years_of_experience: 10)
       abby = project_2.contestants.create(name: "Abby", age: 32, hometown: "Yarmouth", years_of_experience: 8)
       aila = project_3.contestants.create(name: "Aila", age: 30, hometown: "Denver", years_of_experience: 9)

       expect(project_1.contestant_count). to eq(1)
    end

    it "can use average experience method" do
      challenge_4 = Challenge.create(theme: "School", project_budget: 2000)

      project_4 = challenge_4.projects.create(name: "Schoolhouse", material: "books")

      aaron = project_4.contestants.create(name: "Aaron", age: 34, hometown: "Bangor", years_of_experience: 10)
      marlee = project_4.contestants.create(name: "Marlee", age: 33, hometown: "Yarmouth", years_of_experience: 8)
      cheryl = project_4.contestants.create(name: "Cheryl", age: 33, hometown: "Denver", years_of_experience: 9)

      expect(project_4.average_experience).to eq(9)
    end
  end
end
