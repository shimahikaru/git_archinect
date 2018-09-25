class ChangeCategoryToProducts < ActiveRecord::Migration[5.2]
    def up
    change_column :Products, :category, :integer, null: true
  end

  def down
    change_column :Products, :category, :string,  null: true
  end

end
