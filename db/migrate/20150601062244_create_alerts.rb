class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
    	t.integer :amount, :deault => 1
      t.timestamps
    end
  end
end
