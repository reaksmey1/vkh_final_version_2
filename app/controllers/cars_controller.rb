class CarsController < ApplicationController

	def index
		if params[:search] != ""
			params_search = String(params[:search]).downcase
			@cars = Car.where("lower(plate_number) like ?", "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 10)
		else
			@cars = Car.paginate(:page => params[:page], :per_page => 10)
		end
	end

	def new
		@invoice_number = Car.first.nil? ? "INV-00001" : Car.last.invoice_number.next
		@car = Car.new

	end

	def create
		@car = Car.new(car_params)
	  if @car.save
	    redirect_to :controller => 'car_histories', :action => 'index', :car_id => @car.id
	  else
	    render 'new'
	  end
	end

	def show
		puts params
		two_id = params[:id].split("-")
		car_id = two_id[0]
		car_history_id = two_id[1]
		@car_history = CarHistory.find(car_history_id)
		@sell = SellReport.where(:car_id => car_id, :car_history_id => car_history_id)
		@car = Car.find(car_id)
		respond_to do |format|
    format.html
    format.pdf do
      render pdf: "file_name", encoding: "UTF-8", print_media_type: true   # Excluding ".pdf" extension.
    end
    end
	end

	def edit
		@car = Car.find(params[:id])
		@invoice_number = @car.invoice_number
	end

	def update
		@car = Car.find(params[:id])
		@car.update_attributes(car_params)
		if @car.save
	    redirect_to :controller => 'car_histories', :action => 'index', :car_id => @car.id
	  else
	    render 'edit'
	  end
	end

	def destroy
		@car = Car.find(params[:id])
		@car.destroy
		redirect_to :action => :index
		flash.notice = "Car #{@car.plate_number} has been deleted"
	end

	def show_history
		@car_history = CarHistory.where(:car_id => params[:car_id]).paginate(:page => params[:page], :per_page => 10)
	end

	def show_invoice
		@car_history = CarHistory.find(params[:car_id])
		@sell = SellReport.where(:car_history_id => params[:car_id])
		@car = Car.find(@sell.first.car_id)
		respond_to do |format|
    format.html
    format.pdf do
      render pdf: "file_name", encoding: "UTF-8", print_media_type: true   # Excluding ".pdf" extension.
    end
    end
	end

	def print
		# redirect_to show_print_car_history_path
		if params[:_json].count > 0
			car_history = CarHistory.create(:car_id => params[:car_id], :entry_date => params[:_json][0][:entry_date], :invoice_number => params[:_json][0][:invoice_number])
			last_history_id = car_history.id
			params[:_json].each do |el| 
				car_id = el[:car_id]
				entry_date = el[:entry_date]
				if last_history_id
					@sell_report = SellReport.create!(:car_id => car_id,
														 :spare_part_id => SparePart.find_by_code(el[:code].delete(" ")).id,
														 :unit => el[:amount],
														 :selling_price => el[:unit_price],
														 :total_price => el[:total_price],
														 :recieved => el[:recieved],
														 :sub_total => el[:sub_total],
														 :return => el[:return_money],
														 :discount => el[:discount],
														 :total_discount => el[:total_discount],
														 :status => "Paid",
														 :vat => el[:vat],
														 :car_history_id => last_history_id
														)
					spare_part = SparePart.find_by_code(el[:code].delete(" "))
					spare_part.amount_in_stock = spare_part.amount_in_stock.to_f - el[:amount].to_f
					spare_part.save!
					@result = "success-#{car_id}-#{last_history_id}"
					# redirect_to show_print_car_history_path
				else
					@result = "failed"
					break
				end
			end
		end
	end

	private

  def car_params
    params.require(:car).permit(:plate_number, :name, :entry_date, :detail, :color, :phone_number, :conteur, :customer_name, :invoice_number)
  end
	
end
