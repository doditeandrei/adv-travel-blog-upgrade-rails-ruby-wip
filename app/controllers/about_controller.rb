class AboutController < ApplicationController

  def noi
    @about_page = DesprePage.instance
  end

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      @contact.deliver
      @contact = Contact.new
      redirect_to root_path
      flash[:notice] = "Am primit mesajul tau si iti vom raspunde cat mai curand"
    else
      render :index
    end
  end

  def sitemap
    @categories = Category.all.includes(:articles)
    @articles = Article.all
  end

  def T_C
  end

  def cookies
  end

end
