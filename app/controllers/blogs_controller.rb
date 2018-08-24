class BlogsController < ApplicationController
  
before_action :set_blog, only: [:show, :edit, :update]

  def index
  	@blogs = if params[:tag]
  		Blog.tagged_with(params[:tag])
  	else
  		@blogs = Blog.all
  	end
  end

  def show
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

  private

  def set_blog
  	@blog = Blog.find(params[:id])
  end

  def blog_params
  	params.require(:blog).permit(:name, :published_on, :content, :tag_list)
  end
end
