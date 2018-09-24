class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
       t.string :tag, null: false, unique: true
      t.timestamps
    end
  end
end
