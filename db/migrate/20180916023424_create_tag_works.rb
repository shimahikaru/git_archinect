class CreateTagWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_works do |t|
      t.string :work
      t.integer :user_id
      t.timestamps
    end
  end
end
