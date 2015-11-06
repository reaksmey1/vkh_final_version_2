class AlertsController < ApplicationController
	def index
		@alert = Alert.first
		@alerts = SparePart.where("amount_in_stock <= ?", @alert.amount)
	end

	def edit
		@alert = Alert.first
	end

	def update
		@alert = Alert.first
		@alert.update_attributes(alerts_params)
		if @alert.save
	    redirect_to :action => :index
	  else
	    render 'edit'
	  end
	end

	private

  def alerts_params
    params.require(:alert).permit(:amount)
  end
end
