require 'rails_helper'

RSpec.describe 'Astronaut Index' do
  before(:each) do
    @astronaut1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
    @astronaut2 = Astronaut.create!(name: "Buzz", age: 28, job: "Pilot")
    @astronaut3 = Astronaut.create!(name: "Gordon Freeman", age: 27, job: "Theoretical Physicist")
  end

  describe 'User Story 1' do
    it 'When I visit the Astronatus index page' do
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


end