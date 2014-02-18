class ConsiderationItem < ActiveRecord::Base
  belongs_to :pet
  belongs_to :consideration_list
end
