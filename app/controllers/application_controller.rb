class ApplicationController < ActionController::Base

  def main_categories
    @main_categories = MainCategory.all
  end

  def merch_display
    @about_page = DesprePage.instance
  end

  helper_method :main_categories
  helper_method :merch_display

end
