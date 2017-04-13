class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teachers
  has_many :tutorings
  has_many :teachers, through: :tutorings
  has_many :reviews
  has_many :teachers, through: :reviews

  enum role: [ :estudiante, :profesor, :admin ]
end
