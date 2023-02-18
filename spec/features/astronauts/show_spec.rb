require 'rails_helper'

RSpec.describe Astronaut, type: :feature do
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
  
  describe 'Extension 1' do
    it 'visits the astronaut show page and shows a list of all their missions' do
      visit "/astronauts/#{@astronaut1.id}"

      save_and_open_page

      expect(page).to have_content("#{@astronaut1.name}")
      expect(page).to have_content("#{@mission1.title} | #{@mission2.title} | #{@mission3.title} |")
      expect(page).to_not have_content("#{@mission4.title}")
    end
  end
end