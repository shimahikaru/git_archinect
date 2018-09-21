class ChangeTitleToProducts < ActiveRecord::Migration[5.2]
  def up
    change_column :Products, :title, :string, null: true
    change_column :Products, :subtitle, :string, null: true
    change_column :Products, :whet, :integer, null: true
    change_column :Products, :completion, :date, null: true
    change_column :Products, :location, :integer, null: true
    change_column :Products, :area, :float, null: true
    change_column :Products, :text, :text, null: true

  end

  def down
    change_column :Products, :title, :string, null: false
    change_column :Products, :subtitle, :string, null: false
    change_column :Products, :whet, :integer, null: false
    change_column :Products, :completion, :date, null: false
    change_column :Products, :location, :integer, null: false
    change_column :Products, :area, :float, null: false
    change_column :Products, :text, :text, null: false

  end
end








