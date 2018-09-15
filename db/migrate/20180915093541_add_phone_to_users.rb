class AddPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :work, :string
    add_column :users, :offer, :string
    add_column :users, :url, :string
    add_column :users, :avatar, :string
  end
end
