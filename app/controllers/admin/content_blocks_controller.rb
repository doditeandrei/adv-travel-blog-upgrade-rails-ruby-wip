module Admin
  class ContentBlocksController < Fae::StaticPagesController

    private

    def fae_pages
      [DesprePage]
    end
  end
end
