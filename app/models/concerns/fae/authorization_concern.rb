module Fae
  module AuthorizationConcern
    extend ActiveSupport::Concern
    module ClassMethods

      # Use the access_map to define any controllers that need any special authorization
      # Fae comes with three default roles:
      # - super admin: CRUD all objects, INCLUDING users and root settings
      # - admin: CRUD all objects, INCLUDING users and EXCLUDING root settings
      # - users: CRUD all objects, EXCLUDING users and root settings

      # each item should have a string key of the plural controller name and
      # an array of role names for the value
      # use "content_blocks/#{page_name}" for content blocks

      # example:
      # {
      #  'people' => ['super admin', 'admin'],
      #  'content_blocks/about_us' => ['super admin']
      # }
      def access_map
        {
          'categories' => ['super admin'],
          'main_categories' => ['super admin'],
          'authors' => ['super admin'],
          'content_blocks/despre' => ['super admin']
        }
      end

    end
  end
end
