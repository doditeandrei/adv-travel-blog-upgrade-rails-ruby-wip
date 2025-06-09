class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.integer :position

      t.references :main_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
