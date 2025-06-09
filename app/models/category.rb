# frozen_string_literal: true

class Category < ApplicationRecord
  include Fae::BaseModelConcern

  def fae_display_field
    name
  end

  validates :name, :slug, uniqueness: true
  validates :name, :slug, presence: true

  acts_as_list add_new_at: :top
  default_scope { order(:position) }

  has_many :articles
  belongs_to :main_category
end
