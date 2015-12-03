class SparePartsController < ApplicationController
	autocomplete :spare_part, :name, :full => true
	def index
		if params[:search]
			params_search = String(params[:search]).downcase
			@spare_parts = SparePart.where("lower(name) like ? or code like ?", "%#{params[:search]}%", "%#{params[:search]}%").order("id").paginate(:page => params[:page], :per_page => 10)
		else
			@spare_parts = SparePart.order("id").paginate(:page => params[:page], :per_page => 10)
		end
	end

	def new
		@spare_part = SparePart.new
		@spare_part.code = SparePart.last.code.next
	end

	def create
		@spare_part = SparePart.new(spare_part_params)
	  if @spare_part.save
	    redirect_to :action => :index
	  else
	    render 'new'
	  end
	end

	def edit
		@spare_part = SparePart.find(params[:id])
	end

	def update
		@spare_part = SparePart.find(params[:id])
		@spare_part.update_attributes(spare_part_params)
		if @spare_part.save
	    redirect_to :action => :index
	  else
	    render 'edit'
	  end
	end

	def destroy
		@spare_part = SparePart.find(params[:id])
		@spare_part.destroy
		redirect_to :action => :index
		flash.notice = "Item #{@spare_part.name} has been deleted"
	end

	def show
		@spare_part = SparePart.find(params[:id])
	end

	def import_page

	end

	def import
	  SparePart.import(params[:file])
	  redirect_to root_url, notice: "Products imported."
	end

	private

	def spare_part_params
    params.require(:spare_part).permit(:code, :name, :amount_in_stock, :spare_part_type_id, :based_price, :selling_price)
  end
end
