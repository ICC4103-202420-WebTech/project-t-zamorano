# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      unless column_exists?(:users, :email)
        t.string :email, null: false, default: ""
        add_index :users, :email, unique: true
      end
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
    end

    add_index :users, :reset_password_token, unique: true
  end

  def self.down
    remove_index :users, :reset_password_token
    remove_index :users, :email if column_exists?(:users, :email)

    change_table :users do |t|
      t.remove :encrypted_password
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_created_at
      t.remove :sign_in_count
      t.remove :current_sign_in_at
      t.remove :last_sign_in_at
      t.remove :current_sign_in_ip
      t.remove :last_sign_in_ip
    end
  end
end
