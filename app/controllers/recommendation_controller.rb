class RecommendationController < ApplicationController

  def index
   @recommendations = Recommendations.all
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
  def recommendation_params
  params[:recommendation].permit(:matchOne, :matchTwo)
  end

end
