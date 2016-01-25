class AddMoreColumnToCar < ActiveRecord::Migration
  def change
  	add_column	:cars, :color, :string
  	add_column	:cars, :phone_number, :string
  	add_column	:cars, :conteur, :string
  	add_column	:cars, :customer_name, :string
  	add_column 	:cars, :invoice_number, :string
  end
end
