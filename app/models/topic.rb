class Topic < ActiveRecord::Base
  belongs_to :subject
  has_many :tutorings
  has_many :services
  has_many :tests
end
