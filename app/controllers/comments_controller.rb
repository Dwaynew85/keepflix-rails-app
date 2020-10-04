class CommentsController < ApplicationController
  before_action :get_movie
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = @movie.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to current_user
  end

  def update
    @comment.update(comment_params)
    redirect_to current_user
  end

  def destroy
    @comment.destroy
    redirect_to current_user
  end

  private

  def comment_params
    params.require(:comment).permit(:movie_id, :content)
  end   

  def get_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_comment
    @comment = @movie.comments.find(params[:id])
  end
end
