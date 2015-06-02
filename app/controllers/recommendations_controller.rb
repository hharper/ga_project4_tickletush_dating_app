class RecommendationsController < ApplicationController

  def index
   @recommendations = current_user.recommendations
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    if @recommendation = Recommendation.create(recommendation_params)
      flash[:notice] = "Added recommendation"
        redirect_to root_url
      else
        flash[:error] = "Unable to add recommendation"
        redirect_to root_url
      end
    # @recommendation = current_user.create_recommendation!(recommendation_params)

    # @recommendation = current_user.recommendations.build(:secondMatch_id => params[:secondMatch_id], :firstMatch_id => params[:firstMatch_id])
    #   if @recommendation.save
    #     flash[:notice] = "Added recommendation"
    #     redirect_to root_url
    #   else
    #     flash[:error] = "Unable to add recommendation"
    #     redirect_to root_url
    #   end
  end

  # def create
  #   @recommendation = current_user.recommendations.build(:firstMatch_id => params[:firstMatch_id])
  #   if @recommendation.save
  #     flash[:notice] = "Added recommendation"
  #     redirect_to root_url
  #   else
  #     flash[:error] = "Unable to add recommendation"
  #     redirect_to root_url
  #   end
  # end


  def destroy
    @recommendation = current_user.recommendations.find(params[:id])
    @recommendation.destroy
    flash[:notice] = "Successfully removed this recommendation"
    redirect_to current_user
  end

  private

  def recommendation_params
    params[:recommendation].permit(:user_id, :firstMatch_id, :secondMatch_id)
  end

end
