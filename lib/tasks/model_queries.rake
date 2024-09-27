namespace :db do
  desc "Run model queries"
  task model_queries: :environment do
    # Query 1: Name of the student with the most enrolled courses.
    puts("Query 1: Student with the most enrolled courses")
    result = User.joins(:enrollments).where(role: :student).group("users.id").order("COUNT(enrollments.id) DESC").first
    puts result&.full_name
    puts "EOQ"

    # Query 2: Show the course that has the most lessons.
    puts("Query 2: Course with the most lessons")
    result = Course.joins(:lessons).group("courses.id").order("COUNT(lessons.id) DESC").first
    puts result&.title
    puts "EOQ"

    # Query 3: Show the name of the course creator that has created the most courses.
    puts("Query 3: Course creator with the most courses")
    result = User.joins(:courses).where(role: :teacher).group("users.id").order("COUNT(courses.id) DESC").first
    puts result&.full_name
    puts "EOQ"

    # Query 4: Show the last 3 created courses.
    puts("Query 4: Last 3 created courses")
    result = Course.order(created_at: :desc).limit(3)
    result.each { |course| puts course.title }
    puts "EOQ"

    # Query 5: Show the full name of the student who has the most progress on a course.
    puts("Query 5: Student with the most progress on a course")
    result = Enrollment.joins(:user).where(users: { role: :student }).order(progress: :desc).first
    puts result&.user&.full_name
    puts "EOQ"

    # Query 6: Show the title of the course that has the most current students.
    puts("Query 6: Course with the most current students")
    result = Course.joins(:enrollments).group("courses.id").order("COUNT(enrollments.id) DESC").first
    puts result&.title
    puts "EOQ"

    # Query 7: Show the title and number of lessons of the course that has been completed most times.
    puts("Query 7: Course completed the most times")
    result = Course.joins(:enrollments).where("enrollments.progress = 100").group("courses.id").order("COUNT(enrollments.id) DESC").first
    puts "#{result&.title} - Lessons: #{result&.lessons&.count}"
    puts "EOQ"
  end
end
