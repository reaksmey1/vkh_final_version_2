class HistoricalReportsController < ApplicationController
	def index
		if params[:search]
			params_search = String(params[:search]).downcase
			car = Car.where("lower(plate_number) like ?", "%#{params_search}%")
			car_id = car[0].id
			@car_histories = CarHistory.where(:car_id => car_id).paginate(:page => params[:page], :per_page => 10)
		else
			@car_histories = CarHistory.paginate(:page => params[:page], :per_page => 10)
		end
	end

	def show
		@sell_reports = SellReport.where(:car_history_id => params[:id])
	end

	def quote
		@car_history = CarHistory.find(params[:id])
		@car = @car_history.car
		@problem_lists = CarRepairingQuote.all
		@car_repairing_quotes_status = CarRepairingQuoteStatus.where(:car_id => @car_history.id)
	end
end
