class BlogsController < ApplicationController
  
before_action :set_blog, only: [:show, :edit, :update, :delete]
before_action :authenticate_admin!, only: [:new, :edit, :delete]

  def index
  	@blogs = if params[:tag]
  		Blog.tagged_with(params[:tag]).page params[:page]
  	else
  		@blogs = Blog.order('created_at DESC').page params[:page]
  	end
  end

  def show
    fresh_when etag: @blog
  end

  def new
  	@blog = Blog.new
  end

  def create
  	@blog = Blog.new(blog_params)
  	if @blog.save
  		redirect_to @blog, notice: 'Blog was successfully published'
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_path, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete

  end

  def destroy
    @blog = Blog.friendly.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to blogs_path, notice: 'Blog successfully deleted' }
      format.json { head :ok } 
      format.js
    end
  end

  private

  def set_blog
  	@blog = Blog.friendly.find(params[:id])
  end

  def blog_params
  	params.require(:blog).permit(:name, :published_on, :content, :tag_list, :author)
  end
end
