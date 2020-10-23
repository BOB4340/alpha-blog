class ArticlesController < ApplicationController
  def show
    # byebug
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "The record is updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end
end
