class ReceivedRecommendationsController < ApplicationController

  def index
    @recommendations = current_user.recommended_as_match
  end

end
