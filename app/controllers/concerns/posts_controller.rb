class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    if current_user.admin?
      @post = current_user.posts.build
    else
      redirect_to posts_path
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Article was successfully created"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    if !current_user.admin?
      redirect_to posts_path
    end


  end

  def update
      if @post.update(post_params)
        flash[:success] = "Blog post was updated succesfully"
        redirect_to post_path(@post)
      else
        render 'edit'
      end
  end

  def index
    @post = Post.all
  end

  def show

  end

  def destroy
    if current_user.admin?
      @post.destroy
      flash[:danger] = "Article was deleted succesfully"
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:image, :title, :body)
    end
end
