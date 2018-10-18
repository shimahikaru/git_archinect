class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :followers_count, :integer, null: false, default: 0
    add_column :users, :address, :string
    add_column :users, :local, :string
    add_column :users, :phone, :integer
  end
end
