class Author < ApplicationRecord
  include Fae::BaseModelConcern

  def fae_display_field
    name
  end

  validates :name, :bio, :slug, :avatar, :email, presence: true
  validates :name, :slug, uniqueness: true

  acts_as_list add_new_at: :top
  default_scope { order(:position) }

end
