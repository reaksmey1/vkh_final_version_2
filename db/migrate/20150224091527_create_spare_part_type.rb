class CreateSparePartType < ActiveRecord::Migration
  def change
    create_table :spare_part_types do |t|
    	t.string	:name
    	t.timestamps
    end
  end
end
