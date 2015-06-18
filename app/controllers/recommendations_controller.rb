class RecommendationsController < ApplicationController
  before_action :authenticate_user!

  def index
   @recommendations = Recommendation.all
  #  @profile_one = Profile.where("user_id = recommendation.first_match_id")
  #  @first_user = Recommendation.first_match_id
  #  @profile_one = Profile.where("user_id = @first_user")
  end

  def show
    @recommendations = current_user.recommendations
    # @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    # @recommendation = current_user.recommendations.create(recommendation_params)

    @recommendation = current_user.recommendations.create(:second_match_id => params[:second_match_id], :first_match_id => params[:first_match_id], :status_id => params[:status_id])
    # if @recommendation = Recommendation.create(recommendation_params)
      # flash[:notice] = "Added recommendation"
      redirect_to recommendation_path(current_user)
      # else
      #   flash[:error] = "Unable to add recommendation"
      #   redirect_to root_url


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

  def accept_first_match
    @recommendation = Recommendation.find(params[:id])
    @recommendation.accept_first_match
    redirect_to received_recommendations_path
  end

  def accept_second_match
    @recommendation = Recommendation.find(params[:id])
    @recommendation.accept_second_match
    redirect_to received_recommendations_path
  end

  def decline
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.destroy
      flash[:notice] = "Successfully removed this recommendation"
      redirect_to received_recommendations_path
  end
  end

  private
  def recommendation_params
    params[:recommendation].permit(:first_match_id, :second_match_id, :status_id)
  end
end
