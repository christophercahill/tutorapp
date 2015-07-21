class ProfilesController < ApplicationController
	 def new 
    @user = User.find params[:user_id]
    @profile = Profile.new
  end 

  def index
    @profiles = Profile.new  
  end

  def show 
    @profile = Profile.find params[:id]
    user_id = @profile.user_id
    @user = User.find(user_id)
    @posts = @user.courses.all 
  end

  def edit 
    @profile = Profile.find params[:id]
    user_id = @profile.user_id
    @user = User.find(user_id)
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save 
      redirect_to user_profile_path(current_user, @profile)
    else 
      render 'new'
    end 
  end

  def update 
    @profile = Profile.find(params[:id])
    user_id = @profile.user_id
    @user = User.find(user_id)
     if @profile.update(profile_params)
        redirect_to user_profile_path(@user, @profile)
      else
        render 'edit'
      end
  end 

  def destroy
      @profile = Profile.find params[:id]
      @profile.destroy
      redirect_to root_path
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :school, :biography, :major, :user_id, :year)
   end
end 
end