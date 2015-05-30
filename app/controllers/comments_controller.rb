class CommentsController < ApplicationController

  def index
    @comments = Comments.all
  end

  def show
    @comment = Comment.find([params:id])
  end


  def create
    @comment = Comment.create
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    # @profile = current_user.profile.update(profile_params)
    @comment = Comment.find(params[:id])
    @comment.update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to ("/recommendations/show")
  end


end
