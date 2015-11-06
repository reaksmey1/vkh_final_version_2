class SparePartTypesController < ApplicationController
	def index
		if params[:search]
			@spare_part_types = SparePartType.where("name like ?", "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 10)
		else
			@spare_part_types = SparePartType.paginate(:page => params[:page], :per_page => 10)
		end
	end

	def new
		@spare_part_type = SparePartType.new

	end

	def create
		@spare_part_type = SparePartType.new(spare_part_type_params)
	  if @spare_part_type.save
	    redirect_to :action => :index
	  else
	    render 'new'
	  end
	end

	def edit
		@spare_part_type = SparePartType.find(params[:id])
	end

	def update
		@spare_part_type = SparePartType.find(params[:id])
		@spare_part_type.update_attributes(spare_part_type_params)
		if @spare_part_type.save
	    redirect_to :action => :index
	  else
	    render 'edit'
	  end
	end

	def destroy
		@spare_part_type = SparePartType.find(params[:id])
		@spare_part_type.destroy
		redirect_to :action => :index
		flash.notice = "Sparepart type #{@spare_part_type.name} has been deleted"
	end

	private

  def spare_part_type_params
    params.require(:spare_part_type).permit(:name)
  end
end
