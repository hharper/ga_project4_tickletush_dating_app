class AcceptedRecommendationsController < ApplicationController

  def index
    # This page has a lot of responsibilities. We need all recommendations as
    # well as all comments for each recommendation as well as new comments for
    # each recommendation.
    # Somewhere in our page, we'll have
    #   @recommendations.each do |r|
    #     r.comments.each do |c|
    #       # print the comment
    #     end
    #   end
    # AND we need something like:
    #   @recommendations.each do |r|
    #     r.comments.each do |c|
    #       ...
    #       # print the comment form with a new @comment
    #     end
    #   end
    @recommendations = current_user.matched_recommendations
    for rec in @recommendations
    @comments = Comment.where(recommendation_id: rec.id)
    end
    # @recommendation_comments = []
    # @recommendations.each do |recommendation|
    #   recommendation.
    # end
  end

  # def create_comment
  def create
    # @recommendation = Recommendation.find(params[:id])
    @recommendations = current_user.matched_recommendations
    # @recommendation = Recommendation.find_by("id" => recommendations.id)


    for rec in @recommendations
      @comment = Comment.create(:body => params[:comment]["body"], :recommendation_id => rec.id)
    end
    # # @comment = Comment.create("")
    redirect_to "/accepted_recommendations"
  end
end
