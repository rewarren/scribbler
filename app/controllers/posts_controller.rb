class PostsController < ApplicationController
  skip_before_action :authenticate, only: [:index]

  def index
    @posts = Post.all.order(:id).reverse
  end


  def new
    @post = Post.new
  end


  def create
    @post = Post.create!(post_params)
    @post = current_user.create!(post_params)
    redirect_to post_path(@post)
  end


  def show
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])

  end


  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to post_path(@post)
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:author, :date, :title, :content)
  end

end
