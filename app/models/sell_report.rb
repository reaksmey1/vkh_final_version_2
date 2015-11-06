class SellReport < ActiveRecord::Base
	belongs_to :car
	belongs_to :spare_part
end
