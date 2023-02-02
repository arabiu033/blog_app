class CommentsController < ApplicationController
  load_and_authorize_resource only: :destroy

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(parameters)
    if @comment.save
      redirect_to user_posts_path, success: 'Comment added successfully'
    else
      render :new, error: 'Error: Comment could not be saved'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    render :new
  end

  private

  def parameters
    para = params.require(:comment).permit(:text)
    para[:author] = current_user
    para[:post] = Post.find(params[:post_id])
    para
  end
end
