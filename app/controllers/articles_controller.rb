# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order('date DESC').to_a
    @last_article = @articles.shift
    @last_three_articles = @articles.take(3)
    @additional_articles = @articles.sample(6)
  end

  def show
    @article = Article.find_by!(slug: params[:slug])
    @additional_articles = Article.all.sample(4)
    @categories = Category.order(:name)
  end


  def search
    @query = params[:q]
    if @query
      @articles = Article.search(@query, fields: ['title', 'introduction', 'body'], operator: 'or', page: params[:page], per_page: 5)
    end
    @discover_articles = Article.all.order('date DESC').sample(5)
  end

  def all
    @articles = Article.all.order('date DESC').paginate(page: params[:page], per_page: 6)
    @rss_articles = Article.all
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

end
