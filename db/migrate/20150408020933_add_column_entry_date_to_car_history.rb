class AddColumnEntryDateToCarHistory < ActiveRecord::Migration
  def change
  	add_column	:car_histories, :entry_date, :datetime
  end
end
