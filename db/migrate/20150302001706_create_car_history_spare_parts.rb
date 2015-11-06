class CreateCarHistorySpareParts < ActiveRecord::Migration
  def change
    create_table :car_history_spare_parts do |t|
    	t.integer :car_history_id
    	t.integer :spare_part_id
    	t.integer :amount
    	t.float	:unit_price
    	t.float	:total_price
      t.timestamps
    end
  end
end
