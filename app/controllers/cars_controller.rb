class CarsController < ApplicationController

	def index
		@cars = Car.paginate(:page => params[:page], :per_page => 10)
	end

	def new
		@car = Car.new

	end

	def create
		@car = Car.new(car_params)
	  if @car.save
	    redirect_to :action => :index
	  else
	    render 'new'
	  end
	end

	def edit
		@car = Car.find(params[:id])
	end

	def update
		@car = Car.find(params[:id])
		@car.update_attributes(car_params)
		if @car.save
	    redirect_to :action => :index
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

	private

  def car_params
    params.require(:car).permit(:plate_number, :name)
  end
	
end
