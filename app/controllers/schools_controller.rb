class SchoolsController < ApplicationController
	def index 
		@schools = School.all 
	end 

	def show 
		@all_departments = Department.all 
		@school = School.find params[:id]
		@departments = []
		@all_departments.each do |department|
			if department.school == @school
				@departments << department 
			end 
		end 
	end 
end