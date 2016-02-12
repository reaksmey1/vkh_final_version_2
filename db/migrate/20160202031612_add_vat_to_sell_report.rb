class AddVatToSellReport < ActiveRecord::Migration
  def change
  	add_column	:sell_reports, :vat, :float
  end
end
