class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
    	t.integer :post_id
    	t.integer :user_id

      t.timestamps
    end

    # add_index :table_name, :column_name
    add_index :post_votes, :post_id
    add_index :post_votes, :user_id
    add_index :post_votes, [:user_id, :post_id]
  end
end
