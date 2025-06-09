class CategoriesController < ApplicationController

  def show
    @category_slug = category_params[:slug]

    if Category.find_by!(category_params)
      @category_articles = Article.joins(:category).where(categories: { slug: @category_slug }).order('date ASC').paginate(page: params[:page], per_page: 4)
    end
    @categories = Category.order(slug: :asc)
  end

  def index
  end

  def all
    @categories = Category.all
    @articles = Article.all.order('date DESC').take(5)
  end

  private

  def category_params
    params.permit(:slug)
  end
end
