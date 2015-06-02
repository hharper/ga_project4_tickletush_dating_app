class Received_RecommendationsController < ApplicationController

  def index
    @recommendations = current_user.recommended_as_match
  end

end
