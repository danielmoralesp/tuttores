class Service < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :topic
  belongs_to :subject

  enum type_tutoring: [ :a_domicilio, :en_lugar_intermedio, :por_skype ]
  enum academ_level: [ :primaria, :bachillerato, :universitario, :postgrado ]
end
