class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :viewer_id
      t.integer :product_id
      t.text :text
      t.string :name
      t.timestamps
    end
  end
end
