class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :category_id
      t.string :name
      t.string :description
      t.timestamps
    end
    add_index :boards, :created_at
    add_index :boards, :category_id
  end
end
