class Teacher < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  belongs_to :country
  has_many :tutorings
  has_many :users, through: :tutorings
  has_many :experiences
  has_many :services
  has_many :tests
  has_many :reviews
  has_many :users, through: :reviews

  validates :phone, :address, :about_me, presence: true
  validates :about_me, length: { in: 50...500 }
  validates :phone, numericality: { only_integer: true }

  enum role: [ :user, :teacher ]

  before_create :set_default_role

  def set_default_role
    self.role = :teacher
  end

  def self.search(params)
    teachers = Service.where(topic_id: params[:topic].to_i) if params[:topic].present?
    teachers = Teacher.where(city_id: params[:city].to_i)
    teachers
  end
end
