class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string :title
      t.integer :user_id
      t.text :text
      t.integer :type
      t.timestamps
    end
  end
end
