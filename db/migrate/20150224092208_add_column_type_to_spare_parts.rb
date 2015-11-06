class AddColumnTypeToSpareParts < ActiveRecord::Migration
  def change
  	add_column	:spare_parts, :spare_part_type_id, :string
  end
end
