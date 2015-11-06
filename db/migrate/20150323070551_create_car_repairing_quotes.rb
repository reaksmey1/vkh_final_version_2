class CreateCarRepairingQuotes < ActiveRecord::Migration
  def change
    create_table :car_repairing_quotes do |t|
      t.string :name
      t.string :problem_type
  	t.timestamps
    end
  end
end
