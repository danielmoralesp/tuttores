class City < ActiveRecord::Base
  belongs_to :country
  has_many :tutorings
  has_many :teachers
end
