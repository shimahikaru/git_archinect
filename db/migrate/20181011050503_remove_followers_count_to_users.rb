class RemoveFollowersCountToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :followers_count, :integer, null: false, default: 0
  end
end
