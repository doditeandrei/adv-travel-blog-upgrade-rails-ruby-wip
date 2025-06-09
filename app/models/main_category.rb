class MainCategory < ApplicationRecord
  include Fae::BaseModelConcern

  def fae_display_field
    name
  end

  validates :name, :slug, :image, uniqueness: true
  validates :name, :slug, :image, :description, :limit, presence: true
  validates :limit, numericality: { greater_than_or_equal_to: 0 }

  acts_as_list add_new_at: :top
  default_scope { order(:position) }

  has_many :categories

end