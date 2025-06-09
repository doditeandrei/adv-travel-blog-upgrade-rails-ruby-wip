class CreateMainCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :main_categories do |t|
      t.string :name
      t.string :slug
      t.text :image
      t.text :description
      t.integer :limit
      t.integer :position

      t.timestamps
    end
  end
end
