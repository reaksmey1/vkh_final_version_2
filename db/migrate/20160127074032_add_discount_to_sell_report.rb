class AddDiscountToSellReport < ActiveRecord::Migration
  def change
  	add_column	:sell_reports, :discount, :float
  	add_column	:sell_reports, :total_discount, :float
  end
end
