class CoursesController < ContentsController
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @units = @course.units
  end
end