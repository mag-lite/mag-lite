class CreateVideosTable < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.integer :lesson_id
      t.integer :author_id
      t.string  :url
      t.integer :length_ms, :default => 0
      t.timestamps
    end

    add_index :videos, :lesson_id
  end

  def down
    drop_table :videos
  end
end
