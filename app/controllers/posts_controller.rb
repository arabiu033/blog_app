class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments, :likes).where('author_id = ?', @user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.includes(:author).where('post_id = ?', @post.id)
  end

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(parameters)
    if @new_post.save
      redirect_to users_path, success: 'Post saved successfully'
    else
      render :new, notice: 'Error: Post could not be saved'
    end
  end

  private

  def parameters
    para = params.require(:post).permit(:title, :text)
    para[:comments_counter] = 0
    para[:likes_counter] = 0
    para[:author] = create_user
    para
  end
end
