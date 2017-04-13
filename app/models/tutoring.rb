class Tutoring < ActiveRecord::Base
  belongs_to :user
  belongs_to :teacher
  belongs_to :city
  belongs_to :country
  belongs_to :topic
  belongs_to :subject
end
