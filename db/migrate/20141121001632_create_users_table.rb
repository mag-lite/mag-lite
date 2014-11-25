class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email,           :limit => 100
      t.string :password_digest, :limit => 40
      t.string :salt,            :limit => 40
      t.string :group_slug,      :limit => 20, :default => 'user'

      t.string :name
      t.string :heard_from
      
      t.integer :target_score
      t.integer :actual_score

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :group_slug
    add_index :users, :created_at
  end

  def down
    drop_table :users
  end
end
