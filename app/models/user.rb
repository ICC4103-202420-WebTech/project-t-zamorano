class User < ApplicationRecord
  has_many :courses, foreign_key: :creator_id
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course

  enum role: { student: 0, teacher: 1 }
  def full_name
    "#{first_name} #{last_name}"
  end
end
