class CreateJoinTablePostsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :posts, :users, table_name: :collaborators do |t|
      # t.index [:post_id, :user_id]
      # t.index [:user_id, :post_id]
    end
  end
end
