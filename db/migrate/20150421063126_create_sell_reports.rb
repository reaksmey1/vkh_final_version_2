class CreateSellReports < ActiveRecord::Migration
  def change
    create_table :sell_reports do |t|
			t.integer :car_id
    	t.integer :spare_part_id
    	t.float :unit
    	t.float :selling_price
    	t.float :total_price
    	t.float	:recieved
    	t.float	:sub_total
    	t.float :return
    	t.string :status

      t.timestamps
    end
  end
end
