class CreateWholePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :whole_photos do |t|
          t.string :photo
          t.integer :product_id
      t.timestamps
    end
  end
end
