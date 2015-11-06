class CarRepairingQuotesController < ApplicationController
	def new
		@car = Car.find(params[:car_history][:id])
		if CarHistory.find_by_car_id_and_entry_date(params[:car_history][:id], params[:car_history][:entry_date])
			@car_history = CarHistory.find_by_car_id_and_entry_date(params[:car_history][:id], params[:car_history][:entry_date])
		else
			@car_history = CarHistory.create(:car_id => params[:car_history][:id], :entry_date => params[:car_history][:entry_date], :kilo_metre => params[:car_history][:kilo_metre])
		end
		@car_repairing_quotes_status = CarRepairingQuoteStatus.where(:car_id => @car_history.id)
		@problem_lists = CarRepairingQuote.all
	end

	def create
		
	end

	def edit
	end

	def update
		@car = Car.find_by_plate_number(params[:car])
		@car_history = CarHistory.find_by_car_id_and_entry_date(@car.id, params[:car_history])
		@problem_lists = CarRepairingQuote.all
		@car_repairing_quotes_status = CarRepairingQuoteStatus.where(:car_id => @car_history.id)
		if @car_repairing_quotes_status.blank?
			params[:problems_status].each do |key, value|
				problem_id = key
				status_id = value[:status_ids][0]
				CarRepairingQuoteStatus.create(:car_id => @car_history.id, :car_repairing_quote_id => problem_id, :status => status_id)
			end
		else
			params[:problems_status].each do |key, value|
				problem_id = key
				status_id = value[:status_ids][0]
				quote_status = CarRepairingQuoteStatus.find_by_car_id_and_car_repairing_quote_id(@car_history.id, problem_id)
				if quote_status
					quote_status.status = status_id 
					quote_status.save
				else
					CarRepairingQuoteStatus.create(:car_id => @car_history.id, :car_repairing_quote_id => problem_id, :status => status_id)
				end
				# CarRepairingQuoteStatus.create(:car_id => @car_history.id, :car_repairing_quote_id => problem_id, :status => status_id)
			end
		end
	end
end
