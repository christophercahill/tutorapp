class CoursesController < ApplicationController
	  def new 
    @course = Course.new
  end 
 
  def index
    @courses = Course.all 
    
  end

  def search
    @courses = Course.search(params[:search])
    render :index
  end


  def looking_for 
    @all_courses = Course.all
    @courses = []
    @all_courses.each do |course|
      if course.looking_for == false
        @courses << course
      end 
    end 
    @courses = @courses.reverse
  end 

  def offering  
    @all_courses = Course.all
    @courses = []
    @all_courses.each do |course|
      if course.looking_for == true
        @courses << course
      end 
    end 
    @courses = @courses.reverse
  end 

  def show 
    @course = Course.find params[:id]
    user_id = @course.user_id
    @user = User.find(user_id)
    @profile = @user.profile 
  end

  def edit 
    @course = Course.find params[:id]
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    if @course.save 
      redirect_to course_path(@course)
    else 
      render 'new'
    end 
  end

  def update 
    @course = Course.find(params[:id])
     if @course.update(course_params)
        redirect_to @course
      else
        render 'edit'
      end
  end 

  def destroy
      @course = Course.find params[:id]
      @course.destroy
      redirect_to courses_path(current_user)
  end

  private
    def course_params
      params.require(:course).permit(:title, :department_id, :price, :preferred_time, :description, :looking_for, :preferred_people, :grade, :professor, :class_number)
   end
end
