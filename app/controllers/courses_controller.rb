# app/controllers/courses_controller.rb
class CoursesController < ApplicationController
  def index
    @courses = Course.order(created_at: :desc) # Obtiene todos los cursos, ordenados por fecha de creación
  end
end
