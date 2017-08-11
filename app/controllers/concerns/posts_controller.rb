class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @post = Post.all
  end

  def show

  end

  def destroy
    @post.destroy
    flash[:danger] = "Article was deleted succesfully"
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
end
