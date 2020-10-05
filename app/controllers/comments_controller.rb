class CommentsController < ApplicationController
  before_action :get_movie
  before_action :set_comment, only: [:update, :destroy, :edit]

  def create
    @comment = @movie.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    session[:return_to] ||= request.referer
        
    redirect_to session.delete(:return_to) 
    #redirect_to current_user
  end

  def  edit
    session[:return_to] ||= request.referer
  end

  def update
    @comment.update(comment_params)

    redirect_to session.delete(:return_to)
    # redirect_to current_user
  end

  def delete 
  end

  def destroy
    @comment.destroy
    session[:return_to] ||= request.referer
        
    redirect_to session.delete(:return_to) 
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
