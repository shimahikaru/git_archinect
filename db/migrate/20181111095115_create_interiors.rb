class CreateInteriors < ActiveRecord::Migration[5.2]
  def change
    create_table :interiors do |t|
      t.string :room_name
      t.integer :product_id
      t.text :material_one
      t.text :material_two
      t.text :material_three
      t.text :material_four
      t.text :material_five
      t.text :material_six
      t.timestamps
    end
  end
end
