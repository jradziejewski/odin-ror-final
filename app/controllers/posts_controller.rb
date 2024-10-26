class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to [current_user, @post]
    else
      render :error
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
