class Test < ActiveRecord::Base
  belongs_to :subject
  belongs_to :topic
  belongs_to :teacher
end
