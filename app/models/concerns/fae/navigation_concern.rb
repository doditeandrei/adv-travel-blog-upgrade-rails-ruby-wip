module Fae
  module NavigationConcern
    extend ActiveSupport::Concern

    # define the navigation structure in this file
    # example structure:
    #
    # def structure
    #   [
    #     item('Top Nav Item 1', subitems: [
    #       item('Top Nav Dropdown Item 1', class: 'custom-class', path: some_named_route_path),
    #       item('Top Nav Dropdown Item 2', subitems: [
    #         item('Side Nav Item 1', subitems: [
    #           item('Side Nav Nested Item', path: some_named_route_path)
    #         ]),
    #         item('Side Nav Item 1', path: some_named_route_path)
    #       ]),
    #     ]),
    #     item('Pages', subitems: [
    #       item('Home', path: fae.edit_content_block_path('home')),
    #       item('About Us', path: fae.edit_content_block_path('about_us'))
    #     ])
    #   ]
    # end

    def structure
      [
          item('Articles', path: admin_articles_path),
          item('Categories', path: admin_categories_path),
          item('Main Categories', path: admin_main_categories_path),
          item('Authors', path: admin_authors_path),
          item('Despre', path: fae.edit_content_block_path('despre'))
      # scaffold inject marker
      ]
    end

  end
end
