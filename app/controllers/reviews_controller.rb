class ReviewsController < ApplicationController
	def index 
    @profile = Profile.find(params[:profile_id])
  end

  def create
  	@profile = Profile.find(params[:profile_id])
    user_id = @profile.user_id
    @user = User.find(user_id)

    @review = @profile.reviews.create(review_params)
    @review.user_id = current_user.id
    @review.save 
    redirect_to user_profile_path(@user, @profile)
  end

 def destroy
      @profile = Profile.find(params[:profile_id])
      user_id = @profile.user_id
      @user = User.find(user_id)
      @review = @profile.reviews.find(params[:id])
      @review.destroy
      redirect_to user_profile_path(@user, @profile)
 end

 def edit
    @profile = Profile.find(params[:profile_id])
    user_id = @profile.user_id
    @user = User.find(user_id)
    @review = Review.find(params[:id])
  end

 def update
    @profile = Profile.find(params[:profile_id])
    user_id = @profile.user_id
    @user = User.find(user_id)
    @review = Review.find(params[:id])
    if @review.update(review_params) 
      redirect_to user_profile_path(@user, @profile)
    else 
      render 'edit'
    end 
  end

  private
    def review_params
      params.require(:review).permit(:body, :rating)
   end
end