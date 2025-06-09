class AddEmailToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :email, :text
  end
end
