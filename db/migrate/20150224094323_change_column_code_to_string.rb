class ChangeColumnCodeToString < ActiveRecord::Migration
  def change
  	change_column :spare_parts, :code, :string
  end
end
