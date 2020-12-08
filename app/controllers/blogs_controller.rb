class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create    
    @blog = Blog.create(params.require(:blog).permit(:title, :content))
    if @blog.save
      redirect_to new_blog_path, notice:"登録しました"
    elsif
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(params.require(:blog).permit(:title, :content))
    if @blog.save
      redirect_to blogs_path, notice:"修正しました"
    elsif
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def confirm
    @blog = Blog.new(params.require(:blog).permit(:title, :content))
    @blog.id = params[:id]
  end
end