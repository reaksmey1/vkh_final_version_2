class AddKiloMetreToCarHistories < ActiveRecord::Migration
  def change
  	add_column	:car_histories, :kilo_metre, :string
  end
end
