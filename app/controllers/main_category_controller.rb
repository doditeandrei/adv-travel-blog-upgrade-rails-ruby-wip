class MainCategoryController < ApplicationController

  def show
    @main_category = MainCategory.find_by!(slug: params[:slug])

    @articles1 = MainCategory.find_by(slug: params[:slug]).categories.includes(:articles)
    @category_articles = Article.joins(:category).where(categories: { slug: @category_slug }).order('date ASC').paginate(page: params[:page], per_page: 4)
    @articles = @articles1.shuffle
  end

end
