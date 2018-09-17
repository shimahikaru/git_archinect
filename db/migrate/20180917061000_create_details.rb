class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.integer :product_id, null: false
      t.string :image
      t.string :title
      t.string :text
      t.timestamps
    end
  end
end
