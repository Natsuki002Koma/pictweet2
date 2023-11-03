class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to tweet_comments_path(comment.tweet_id)  # redirect_to "/tweets/#{comment.tweet.id}" 
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
