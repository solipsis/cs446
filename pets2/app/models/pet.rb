class Pet < ActiveRecord::Base
	has_many :consideration_items
	belongs_to :foster_parent
	STATUS = ["available", "fostered"]

	
	validates :name, :species, :image_url, :age, presence: true

	validates :age, numericality: {greater_than: 0}

	validates :name, uniqueness: true
end
