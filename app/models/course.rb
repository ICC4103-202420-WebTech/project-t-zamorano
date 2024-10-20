class Course < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :lessons
  has_many :enrollments
  has_many :students, through: :enrollments, source: :user
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
