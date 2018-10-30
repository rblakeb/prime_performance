class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :delete]
  before_action :authenticate_admin!, only: [:new, :edit, :delete]

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully published'
    else
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_path, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  def destroy
    @article = Article.friendly.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to new_article_path, notice: 'Article successfully deleted' }
      format.json { head :ok } 
      format.js
    end
  end

  private

  def set_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
