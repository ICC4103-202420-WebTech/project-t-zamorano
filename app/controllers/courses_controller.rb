class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  def index
    @courses = Course.order(created_at: :desc) # Obtiene todos los cursos ordenados
  end

  def show
    # Muestra detalles de un curso
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course, notice: "Course was successfully created."
    else
      render :new, alert: "Error creating course."
    end
  end

  def edit
    # Carga el curso para ser editado
    puts @course.inspect  # Esto te mostrará el objeto en la consola del servidor
  end


  def update
    puts params.inspect  # Muestra los parámetros en la consola del servidor
    if @course.update(course_params)
      flash[:notice] = "Course updated successfully."
      redirect_to @course
    else
      flash.now[:alert] = "Failed to update course."
      render :edit
    end
  end



  def destroy
    @course.destroy
    redirect_to courses_path, notice: "Course was successfully deleted."
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :creator_id)
  end
end
