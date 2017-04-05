class BlogsController < ApplicationController
  def index
    @blog_posts = BlogPost.where(approved: true).order("created_at DESC")
  end

  def new
    @blog_post = BlogPost.new
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def create
    @blog_post = BlogPost.new(blog_params)
    @blog_post.user = current_user
    @blog_posts.approved = true

    if @blog_post.save
      redirect_to blogs_url
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog_post).permit(:id, :title, :content, :picture, :approved)
  end
end
