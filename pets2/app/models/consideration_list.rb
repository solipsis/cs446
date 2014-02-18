class ConsiderationList < ActiveRecord::Base
	has_many :consideration_items, dependent: :destroy
end
