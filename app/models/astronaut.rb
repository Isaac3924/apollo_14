class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.avg_age
    average(:age)
  end

  def sort_missions_alphabetically
    missions.order(:title)
  end
end
