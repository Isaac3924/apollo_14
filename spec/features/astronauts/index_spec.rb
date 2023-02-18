require 'rails_helper'

RSpec.describe 'Astronaut Index' do
  before(:each) do
    @astronaut1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
    @astronaut2 = Astronaut.create!(name: "Buzz", age: 28, job: "Pilot")
    @astronaut3 = Astronaut.create!(name: "Gordon Freeman", age: 27, job: "Theoretical Physicist")

    @mission1 = Mission.create!(title: "Gemini 7", time_in_space: 4)
    @mission2 = Mission.create!(title: "Apollo 13", time_in_space: 2)
    @mission3 = Mission.create!(title: "Capricorn 4", time_in_space: 7)
    @mission4 = Mission.create!(title: "Virgo 9", time_in_space: 7)

    AstronautMission.create!(astronaut: @astronaut1, mission: @mission1)
    AstronautMission.create!(astronaut: @astronaut1, mission: @mission2)
    AstronautMission.create!(astronaut: @astronaut1, mission: @mission3)
    AstronautMission.create!(astronaut: @astronaut2, mission: @mission4)
  end

  describe 'User Story 1' do
    it 'When I visit the Astronauts index page' do
      visit '/astronauts'

      expect(page).to have_content("Astronaut Index")
    end

    it 'Can see the list of astronauts with their name, age, and job' do
      visit '/astronauts'

      expect(page).to have_content("Name: #{@astronaut1.name}, Age: #{@astronaut1.age}, Job: #{@astronaut1.job}")
      expect(page).to have_content("Name: #{@astronaut2.name}, Age: #{@astronaut2.age}, Job: #{@astronaut2.job}")
      expect(page).to have_content("Name: #{@astronaut3.name}, Age: #{@astronaut3.age}, Job: #{@astronaut3.job}")
    end
  end

  describe 'User Story 2' do
    it 'When I visit the Astronatus index page, I can see the average age of all astronauts' do
      visit '/astronauts'

      expect(page).to have_content("Average Age: 31")
    end
  end

  describe 'User Story 3' do
    it 'When I visit the Astronatus index page, I can see a list of the space missions'' for each astronaut' do
      visit '/astronauts'
      # require 'pry'; binding.pry
      save_and_open_page

      within ("##{@astronaut1.id}") do
        expect(page).to have_content(@mission1.title)
        expect(page).to have_content(@mission2.title)
        expect(page).to have_content(@mission3.title)

        expect(@mission2.title).to appear_before(@mission3.title)
        expect(@mission2.title).to appear_before(@mission1.title)
        expect(@mission3.title).to appear_before(@mission1.title)
        expect(@mission1.title).to_not appear_before(@mission2.title)
        expect(@mission1.title).to_not appear_before(@mission3.title)
      end
    end
  end

  describe 'User Story 4' do

  end
end