class CreateCarRepairingQuoteStatuses < ActiveRecord::Migration
  def change
    create_table :car_repairing_quote_statuses do |t|
    	t.integer :car_id
    	t.integer :car_repairing_quote_id
    	t.string :status
    t.timestamps
    end
  end
end
