class CommentsController < ApplicationController
  load_and_authorize_resource only: :destroy

  def index
    @comments = Comment.where('post_id = ?', params[:post_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(parameters)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to user_posts_path, success: 'Comment added successfully' }
        format.json { render json: @comment, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, error: 'Error: Comment could not be saved' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
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
