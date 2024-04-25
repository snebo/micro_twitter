class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  def create
    @user = User.find(current_user[:id])
    @post = @user.posts.create(post_params)
    if @post.save
      redirect_to root_path, notice: "Posted!"
    else
      render :new, status: :unprocessable_entity, notice: "failed to create post"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  def update
    @user = User.find(current_user[:id])
    @post = @user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity, notice:"failed to update post"
    end
  end

  def destroy
    @user = User.find(current_user[:id])
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path, status: :see_other, notice:"post deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
