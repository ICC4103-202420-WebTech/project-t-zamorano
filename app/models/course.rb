class Course < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :lessons
  has_many :enrollments
  has_many :students, through: :enrollments, source: :user
end
