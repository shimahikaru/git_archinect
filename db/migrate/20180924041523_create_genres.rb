class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
     t.string :tag, null: false, unique: true
      t.timestamps
    end
  end
end
