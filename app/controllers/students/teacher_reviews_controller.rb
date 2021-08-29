class Students::TeacherReviewsController < Students::ApplicationController
  def show
    @review = Review.find(params[:review])
  end
end
