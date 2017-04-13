class Country < ActiveRecord::Base
  has_many :cities
  has_many :teachers
  has_many :tutorings
end
