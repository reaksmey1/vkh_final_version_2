class AddCarHistoryIdToSellReport < ActiveRecord::Migration
  def change
  	add_column	:sell_reports, :car_history_id, :integer
  end
end
