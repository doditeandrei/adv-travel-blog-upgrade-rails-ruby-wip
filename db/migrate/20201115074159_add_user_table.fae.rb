# This migration comes from fae (originally 20140809222030)
class AddUserTable < ActiveRecord::Migration[6.0]
  def change
    create_table(:fae_users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      # non-devise attributes
      t.string  :first_name
      t.string  :last_name
      t.integer :role_id
      t.boolean :active
      t.string :language

      t.timestamps
    end

    add_index :fae_users, :email,                :unique => true
    add_index :fae_users, :reset_password_token, :unique => true
    add_index :fae_users, :confirmation_token,   :unique => true
    add_index :fae_users, :unlock_token,         :unique => true
    add_index :fae_users, :role_id
  end
end
