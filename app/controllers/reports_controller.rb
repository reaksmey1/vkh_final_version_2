class ReportsController < ApplicationController
	def index
		@type = ""
		if params[:search] && params[:search] != ""
			params_search = String(params[:search]).downcase
			@spare_part_ids = SparePart.where("lower(name) like ?", "%#{params[:search]}%").select(:id)
			if params[:type] != ""
				@type = params[:type]
				@spare_part_ids = SparePart.where("lower(name) like ? and spare_part_type_id = ?", "%#{params[:search]}%", params[:type]).select(:id)
			end
			@sell_report_temp = SellReport.where("spare_part_id in (?)",@spare_part_ids)
			if params[:from] != "" && params[:to] != ""
				@sell_report_temp = @sell_report_temp.where(:created_at => params[:from].to_date..params[:to].to_date)
			end
			@sell_reports = @sell_report_temp.group('spare_part_id').sum(:total_price)
			@total = @sell_report_temp.sum(:total_price)
		elsif params[:from] && params[:to]
			if params[:type] != ""
				@type = params[:type]
				@spare_part_ids = SparePart.where(:spare_part_type_id => params[:type]).select(:id)
				@sell_report_temp = SellReport.where("spare_part_id in (?)", @spare_part_ids)
			else
				@sell_report_temp = SellReport.all
			end
			@sell_reports = @sell_report_temp.where(:created_at => params[:from].to_date..params[:to].to_date).group('spare_part_id').sum(:total_price)
			@total = @sell_report_temp.where(:created_at => params[:from].to_date..params[:to].to_date).sum(:total_price)
		else
			@sell_reports = SellReport.group('spare_part_id').sum(:total_price)
			@total = SellReport.all.sum(:total_price)
		end
	end
end
