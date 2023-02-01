class LikesController < ApplicationController
  def create
    @like = Like.new(parameters)
    if @like.save
      redirect_to user_posts_path, success: 'Like added successfully'
    else
      render :new, error: 'Error: Like could not be added'
    end
  end

  private

  def parameters
    para = {}
    para[:author] = current_user
    para[:post] = Post.find(params[:post_id])
    para
  end
end
