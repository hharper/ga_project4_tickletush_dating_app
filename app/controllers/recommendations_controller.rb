class RecommendationsController < ApplicationController

  def index
   @recommendations = current_user.recommendations
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def create
    @recommendation = current_user.recommendations.build(:recommended_id => params[:recommended_id])
    if @recommendation.save
      flash[:notice] = "Added recommendation"
      redirect_to root_url
    else
      flash[:error] = "Unable to add recommendation"
      redirect_to root_url
    end
  end


  def destroy
    @recommendation = current_user.recommendations.find(params[:id])
    @recommendation.destroy
    flash[:notice] = "Successfully removed this recommendation"
    redirect_to current_user
  end

  private

  def recommendation_params
    params[:recommendation].permit(:matchOne, :matchTwo)
  end

end
