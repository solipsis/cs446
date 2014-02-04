class Pet < ActiveRecord::Base
	validates :name, :species, :image_url, :age, presence: true

	validates :age, numericality: {greater_than: 0}

	validates :name, uniqueness: true
end
