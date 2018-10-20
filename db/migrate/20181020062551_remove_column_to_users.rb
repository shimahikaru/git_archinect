class RemoveColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :followers_count, :integer, null: false, default: 0
    remove_column :users, :address, :string
    remove_column :users, :local, :string
    remove_column :users, :phone, :integer
  end
end
