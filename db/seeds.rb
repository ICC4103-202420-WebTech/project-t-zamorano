# Create Users
terry = User.create!(first_name: 'Terry', last_name: 'Bogard', email: 'terry.bogard@example.com', role: :teacher)
joel = User.create!(first_name: 'Joel', last_name: 'Miller', email: 'joel.miller@example.com', role: :teacher)
walter = User.create!(first_name: 'Walter', last_name: 'White', email: 'walter.white@example.com', role: :teacher)

ellie = User.create!(first_name: 'Ellie', last_name: 'Williams', email: 'ellie.williams@example.com', role: :student)
jessie = User.create!(first_name: 'Jessie', last_name: 'Pinkman', email: 'jessie.pinkman@example.com', role: :student)
andy = User.create!(first_name: 'Andy', last_name: 'Bogard', email: 'andy.bogard@example.com', role: :student)

alice = User.create!(first_name: 'Alice', last_name: 'Wonder', email: 'alice.wonder@example.com', role: :student)
bob = User.create!(first_name: 'Bob', last_name: 'Marley', email: 'bob.marley@example.com', role: :student)

# Create Courses
course1 = Course.create!(title: "Course 1 by Terry", description: "Description for Course 1", creator: terry)
course2 = Course.create!(title: "Course 2 by Walter", description: "Description for Course 2", creator: walter)
course3 = Course.create!(title: "Course 3 by Joel", description: "Description for Course 3", creator: joel)
course4 = Course.create!(title: "Course 4 by Walter", description: "Description for Course 4", creator: walter)

# Create Individual Lessons for each course
# Course 1
Lesson.create!(title: "Lesson 1 of Course 1", content: "Content for lesson 1", lesson_type: :video, course: course1)
Lesson.create!(title: "Lesson 2 of Course 1", content: "Content for lesson 2", lesson_type: :text, course: course1)
Lesson.create!(title: "Lesson 3 of Course 1", content: "Content for lesson 3", lesson_type: :video, course: course1)
Lesson.create!(title: "Lesson 4 of Course 1", content: "Content for lesson 4", lesson_type: :text, course: course1)

# Course 2
Lesson.create!(title: "Lesson 1 of Course 2", content: "Content for lesson 1", lesson_type: :video, course: course2)
Lesson.create!(title: "Lesson 2 of Course 2", content: "Content for lesson 2", lesson_type: :text, course: course2)
Lesson.create!(title: "Lesson 3 of Course 2", content: "Content for lesson 3", lesson_type: :video, course: course2)
Lesson.create!(title: "Lesson 4 of Course 2", content: "Content for lesson 4", lesson_type: :text, course: course2)

# Course 3
Lesson.create!(title: "Lesson 1 of Course 3", content: "Content for lesson 1", lesson_type: :text, course: course3)
Lesson.create!(title: "Lesson 2 of Course 3", content: "Content for lesson 2", lesson_type: :video, course: course3)
Lesson.create!(title: "Lesson 3 of Course 3", content: "Content for lesson 3", lesson_type: :text, course: course3)
Lesson.create!(title: "Lesson 4 of Course 3", content: "Content for lesson 4", lesson_type: :video, course: course3)

# Course 4
Lesson.create!(title: "Lesson 1 of Course 4", content: "Content for lesson 1", lesson_type: :text, course: course4)
Lesson.create!(title: "Lesson 2 of Course 4", content: "Content for lesson 2", lesson_type: :video, course: course4)
Lesson.create!(title: "Lesson 3 of Course 4", content: "Content for lesson 3", lesson_type: :text, course: course4)
Lesson.create!(title: "Lesson 4 of Course 4", content: "Content for lesson 4", lesson_type: :video, course: course4)

# Enroll Students and Create Progress
[ ellie, jessie, andy, alice, bob ].each do |student|
  Course.all.each do |course|
    Enrollment.create!(user: student, course: course, progress: rand(0..100))
  end
end
