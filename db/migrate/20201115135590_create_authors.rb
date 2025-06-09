class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :slug
      t.text :bio
      t.text :avatar
      t.integer :position

      t.timestamps
    end
  end
end
