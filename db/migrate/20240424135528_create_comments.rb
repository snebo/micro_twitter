class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.timestamps
    end
    # add coloums for foriegn key
    add_column :comments, :post_id, :integer
    add_column :comments, :user_id, :integer

    # add keys
    add_foreign_key :comments, :posts, column: :post_id
    add_foreign_key :comments, :users, column: :user_id
  end
end
