# frozen_string_literal: true

class Article < ApplicationRecord
  include Fae::BaseModelConcern

  # only index (and enable callbacks) in Production
  searchkick callbacks: Rails.env.production? ? :async : false

  def fae_display_field
    title
  end

  validates :title, :introduction, :slug, :author, :intro_photo, :body, presence: true
  validates :slug, uniqueness: true

  belongs_to :category
  belongs_to :author

  acts_as_list add_new_at: :top
end
