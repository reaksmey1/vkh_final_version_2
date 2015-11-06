class CreateCarHistories < ActiveRecord::Migration
  def change
    create_table :car_histories do |t|
  		t.integer :car_id
  		t.string	:problem
      t.timestamps
    end
  end
end
