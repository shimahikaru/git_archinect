class CreateGenreTags < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_tags do |t|
      t.integer :product_id, null: false
      t.boolean :genre1
      t.boolean :genre2
      t.boolean :genre3
      t.boolean :genre4
      t.boolean :genre5
      t.boolean :genre6
      t.boolean :genre7
      t.boolean :genre8
      t.boolean :genre9
      t.boolean :genre10
      t.boolean :genre11
      t.boolean :genre12
      t.boolean :genre13
      t.boolean :genre14
      t.boolean :genre15
      t.timestamps
    end
  end
end
