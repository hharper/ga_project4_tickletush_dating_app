class RecommendationController < ApplicationController

  def index
   @recommendations = current_user.recommendations
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end


  def create
    @recommendation = current_user.recommendations.new(recommendation_params)
    if @recommendation.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @recommendation = Recommendation.find(parms[:id])
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.update (recommendation_params)
      redirect_to @recommendation
    else
      render :edit
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy
    redirect_to ("/recommendations")
  end

  private
  
  def recommendation_params
  params[:recommendation].permit(:matchOne, :matchTwo)
  end

end
