class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
    	t.string :plate_number
    	t.string :name
      t.timestamps
    end
  end
end
