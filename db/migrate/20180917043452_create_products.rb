class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :subtitle, null: false
      t.integer :whet, null: false
      t.date :completion, null: false
      t.integer :location, null: false
      t.string :location2
      t.float :area, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
