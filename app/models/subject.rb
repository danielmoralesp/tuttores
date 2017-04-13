class Subject < ActiveRecord::Base
  has_many :topics
  has_many :tutorings
  has_many :services
  has_many :tests
end
