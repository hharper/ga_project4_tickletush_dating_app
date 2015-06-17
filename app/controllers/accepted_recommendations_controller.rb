class AcceptedRecommendationsController < ApplicationController

  def index
    @recommendations = current_user.matched_recommendations
    for rec in @recommendations
    @comments = Comment.where(recommendation_id: rec.id)
    end
  end

  def create
    @recommendations = current_user.matched_recommendations
    # @recommendation = Recommendation.find_by("id" => recommendations.id)
    for rec in @recommendations
      @comment = Comment.create(:body => params[:comment]["body"], :recommendation_id => rec.id)
    end
    # # @comment = Comment.create("")
    redirect_to "/accepted_recommendations"
  end

end
