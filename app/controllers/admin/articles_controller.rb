# frozen_string_literal: true

module Admin
  class ArticlesController < Fae::BaseController
    before_action :verify_if_owner
    skip_before_action :verify_if_owner, except: :edit
    before_action :assign_author, only: :create


    private

    def assign_author
      author = Author.find_by(email: current_user.email)
      if author.nil? || current_user.super_admin?
        flash[:error] = "An author with your email address does not exist, contact the admin."
        return
      end

      if params[:article][:author_id].nil? || params[:article][:author_id].empty?
        params[:article][:author_id] = author.id
      end
    end

    def verify_if_owner
      unless current_user.email == @item.author.email || current_user.super_admin?
        flash[:error] = "You are not authorized to view the requested page."
        redirect_to(admin_articles_path)
      end
    end
  end
end
