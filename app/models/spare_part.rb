require 'csv'

class SparePart < ActiveRecord::Base
	belongs_to	:spare_part_type
	has_many :sell_reports

	def self.import(file)
		spreadsheet = File.open(file.path)
	  # spreadsheet = open_spreadsheet(file)
	  CSV.foreach(file.path) do |row|
	  	sparepart = SparePart.new
	  	sparepart.code = SparePart.last.code.next
	  	sparepart.name = row[0]
	  	# sparepart.spare_part_type_id = row[2]
	  	# sparepart.amount_in_stock = row[3]
	  	# sparepart.based_price = row[4]
	  	# sparepart.selling_price = row[5]
	  	sparepart.save
    # use row here...
  	end
	  # debugger
	  # header = spreadsheet.row(1)
	  # (2..spreadsheet.last_row).each do |i|
	  #   row = Hash[[header, spreadsheet.row(i)].transpose]
	  #   product = find_by_id(row["id"]) || new
	  #   product.attributes = row.to_hash.slice(*accessible_attributes)
	  #   product.save!
  	# end
	end
end
