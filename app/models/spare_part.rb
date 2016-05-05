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
	end

	def self.download_csv
		spare_parts = SparePart.all
    CSV.generate do |csv|
      spare_parts.each do |ar|
        csv << [
          ar.code,
          ar.name.force_encoding("UTF-8")
        ]
      end
    end
  end

end
