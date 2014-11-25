class CreateLessonsTable < ActiveRecord::Migration
  def up
    create_table :lessons do |t|
      t.string  :name
      t.text    :description
      t.text    :admin_notes

      t.boolean :published,     :default => false
      t.integer :display_order, :default => 0
      t.integer :uploader_id

      t.timestamps
    end

    add_index :lessons, [:published, :display_order]
    add_index :lessons, :display_order
    add_index :lessons, :uploader_id
  end

  def down
    drop_table :lessons
  end
end
