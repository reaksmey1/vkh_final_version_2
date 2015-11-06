class CreateSpareParts < ActiveRecord::Migration
  def change
    create_table :spare_parts do |t|
    	t.integer	:code
    	t.string	:name
    	t.integer	:amount_in_stock
    	t.float	:based_price
    	t.float	:selling_price
      t.timestamps
    end
  end
end
