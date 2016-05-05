class AddInvoiceNumberToCarHistory < ActiveRecord::Migration
  def change
  	add_column :car_histories, :invoice_number, :string 
  end
end
