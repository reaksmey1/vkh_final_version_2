class CarHistoriesController < ApplicationController
	def index
		@car = CarHistory.new
		@spare_part = SparePart.new
		@car_info = Car.find_by_id(params[:car_id])
	end

	def new
		@car = CarHistory.new
		@spare_part = SparePart.new
	end

	def create
		if params[:spare_part]
			spare_part_params = params[:spare_part][:name].split(",")
			@amount = spare_part_params[1].nil? ? 1 : spare_part_params[1]
			name = spare_part_params[0]
			@spare_part = SparePart.find_by_name(name)
			@sell_price = @spare_part.selling_price.nil? ? 0 : @spare_part.selling_price
			@total = @amount.to_i * @sell_price if @spare_part
		end
		if @spare_part
			@result = "success"
		else
			@result = "failed"
		end
		# @plate_number = "" if @car.nil?
		respond_to do |format|
			format.js
		end
	end

	def show
		@sell = SellReport.where(:car_history_id => params[:id])
		respond_to do |format|
    format.html
    format.pdf do
      render pdf: "file_name"   # Excluding ".pdf" extension.
    end
    end
	end

	def show_print

	end

	def print
		# redirect_to show_print_car_history_path
		if params[:_json].count > 0
			params[:_json].each do |el| 
				car_id = el[:car_id]
				entry_date = el[:entry_date]
				car_history = CarHistory.last.id + 1
				if car_history
					@sell_report = SellReport.create!(:car_id => params[:id],
														 :spare_part_id => SparePart.find_by_code(el[:code].delete(" ")).id,
														 :unit => el[:amount],
														 :selling_price => el[:unit_price],
														 :total_price => el[:total_price],
														 :recieved => el[:recieved],
														 :sub_total => el[:sub_total],
														 :return => el[:return_money],
														 :discount => el[:discount],
														 :total_discount => el[:total_discount],
														 :vat => el[:vat],
														 :status => "Paid",
														 :car_history_id => car_history.id
														)
					spare_part = SparePart.find_by_code(el[:code].delete(" "))
					spare_part.amount_in_stock = spare_part.amount_in_stock.to_f - el[:amount].to_f
					spare_part.save!
					@result = "success-#{car_history.id}"
					# redirect_to show_print_car_history_path
				else
					@result = "failed"
					break
				end
			end
		end
	end
end
