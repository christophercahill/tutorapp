class DepartmentsController < ApplicationController
	def index 
		@departments = Department.all 
	end 

	def show 
		@all_courses = Course.all 
		@department = Department.find params[:id]
		@courses = []
		@all_courses.each do |course|
			if course.department == @department
				@courses << course
			end 
		end 
	end
end