class Lesson < ApplicationRecord
  belongs_to :course
  enum lesson_type: { video: 0, text: 1 }
end
