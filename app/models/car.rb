class Car < ActiveRecord::Base
	has_many :sell_reports
	has_many :car_histories
end
