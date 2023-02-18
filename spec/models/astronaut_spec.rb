require 'rails_helper'

RSpec.describe Astronaut, type: :model do
  before(:each) do
    @astronaut1 = Astronaut.create!(name: "Neil Armstrong", age: 30, job: "Commander")
    @astronaut2 = Astronaut.create!(name: "Buzz", age: 30, job: "Pilot")
    @astronaut3 = Astronaut.create!(name: "Gordon Freeman", age: 30, job: "Theoretical Physicist")
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  it '#avg_age' do
    expect(Astronaut.avg_age).to eq(30)
  end

  it '#sort_missions_alphabetically' do
    mission1 = Mission.create!(title: "Gemini 7", time_in_space: 4)
    mission2 = Mission.create!(title: "Apollo 13", time_in_space: 2)
    mission3 = Mission.create!(title: "Capricorn 4", time_in_space: 7)

    AstronautMission.create!(astronaut: @astronaut1, mission: mission1)
    AstronautMission.create!(astronaut: @astronaut1, mission: mission2)
    AstronautMission.create!(astronaut: @astronaut1, mission: mission3)

    expect(@astronaut1.sort_missions_alphabetically).to eq([mission2, mission3, mission1])
  end
end
