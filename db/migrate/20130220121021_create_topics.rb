class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.integer :board_id
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :topics, :user_id
    add_index :topics, :board_id
    add_index :topics, [:user_id, :board_id]
  end
end
