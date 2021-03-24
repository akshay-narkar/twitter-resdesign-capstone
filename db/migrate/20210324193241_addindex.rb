class Addindex < ActiveRecord::Migration[6.1]
  def change
    add_index(:followings, [:follower_id, :followed_id])
    add_index(:tweets, :author_id)
    add_foreign_key :tweets, :users, column: :author_id
    add_foreign_key :followings, :users, column: :follower_id
    add_foreign_key :followings, :users, column: :followed_id
  end
end
