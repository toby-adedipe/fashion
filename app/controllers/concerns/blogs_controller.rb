class BlogsController < ApplicationController
  def index
    @post = Post.all
  end
end
