class AcceptedRecommendationsController < ApplicationController

  def index
    @recommendations = current_user.matched_recommendations
  end

end
