class AddTypeEntryDateDetailToCar < ActiveRecord::Migration
  def change
		add_column	:cars, :type, :integer
		add_column	:cars, :entry_date, :datetime
		add_column	:cars, :detail,	:string
  end
end
