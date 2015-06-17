class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end


  def new
    @comment = Comment.new
  end

  def create
    @recommendation = Recommendation.find(params[:recommendation_id])
    @comment = @recommendation.comments.create!
    redirect_to "/accepted_recommendations"
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to ("/accepted_recommendations")
  end


end
