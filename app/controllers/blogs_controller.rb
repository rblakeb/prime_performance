class BlogsController < ApplicationController
  
before_action :set_blog, only: [:show, :edit, :update, :delete]
before_action :authenticate_admin!, only: [:new, :edit, :delete]

  def index
  	@blogs = if params[:tag]
  		Blog.tagged_with(params[:tag])
  	else
  		@blogs = Blog.all
  	end
  end

  def show
    fresh_when last_modified: @blog.updated_at
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
    @blog = Blog.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to blogs_path, notice: 'Blog successfully deleted' }
      format.json { head :ok } 
      format.js
    end
  end

  private

  def authenticate_admin!
    unless current_admin
      redirect_back(fallback_location: root_path)
      flash[:notice] = "Sorry, you can't do that"
    end
  end

  def set_blog
  	@blog = Blog.find(params[:id])
  end

  def blog_params
  	params.require(:blog).permit(:name, :published_on, :content, :tag_list)
  end
end
