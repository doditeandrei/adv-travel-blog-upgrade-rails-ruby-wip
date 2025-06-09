class AuthorsController < ApplicationController

  def show
    @author_name = author_params[:slug]

    if Author.find_by!(author_params)
      @author_articles = Article.joins(:author).where(authors: { slug: @author_name }).order('date ASC').paginate(page: params[:page], per_page: 4)
    end
    @authors = Author.order(slug: :asc)
  end

  def all
    @authors = Author.all
    @author_articles = Article.joins(:author).where(authors: { slug: @author_name }).order('date ASC').paginate(page: params[:page], per_page: 4)
  end

  private

  def author_params
    params.permit(:slug)
  end
end
