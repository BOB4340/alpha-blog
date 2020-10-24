class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # byebug
    #@article = Article.find(params[:id])
  end

  def index
    # byebug
    @article = Article.all
  end

  def new
    # create this instance variable when the form is first loaded.
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article]
    #@article = Article.new(params.require(:article).permit(:title, :description))
    @article = Article.new(article_param)
    # render plain: @article.inspect
    if @article.save
      flash[:notice] = 'The record is saved successfully.'
      redirect_to article_path(@article) # redirect_to @ article is shorthand of redirect_to article_path(@article)
    else
      # call the new action when the form data cannot be saved
      render 'new'
    end
  end

  def update
    #@article = Article.find(params[:id])
    #if @article.update(params.require(:article).permit(:title, :description))
    if @article.update(article_param)
      flash[:notice] = "The record is updated successfully."
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_param
    params.require(:article).permit(:title, :description)
  end
end
