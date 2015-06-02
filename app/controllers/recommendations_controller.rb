class RecommendationsController < ApplicationController

  def index
   @recommendations = Recommendation.all
  end

  def show
    @recommendations = current_user.recommendations
    # @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    if @recommendation = current_user.recommendations.create(recommendation_params)
    # if @recommendation = Recommendation.create(recommendation_params)
      flash[:notice] = "Added recommendation"
        redirect_to root_url
      else
        flash[:error] = "Unable to add recommendation"
        redirect_to root_url
      end

    # @recommendation = current_user.recommendations.build(:secondMatch_id => params[:secondMatch_id], :first_match_id => params[:first_match_id])
    #   if @recommendation.save
    #     flash[:notice] = "Added recommendation"
    #     redirect_to root_url
    #   else
    #     flash[:error] = "Unable to add recommendation"
    #     redirect_to root_url
    #   end
  end


  def destroy
    @recommendation = current_user.recommendations.find(params[:id])
    @recommendation.destroy
    flash[:notice] = "Successfully removed this recommendation"
    redirect_to current_user
  end



  private
  def recommendation_params
    params[:recommendation].permit(:first_match_id, :second_match_id, :status_id)
  end

end
