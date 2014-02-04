require 'test_helper'

class PetTest < ActiveSupport::TestCase
  test "pet attributes cant be empty" do
  	pet = Pet.new
  	assert pet.invalid?
  	assert pet.errors[:name].any?
  	assert pet.errors[:species].any?
  	assert pet.errors[:age].any?
  	assert pet.errors[:image_url].any?
  end

  test "age must be greater than 0" do
  	pet = Pet.new(name: 'fido', species: 'shark', image_url: 'shark.jpg')
  	pet.age = -1
  	assert pet.invalid?
  	assert_equal ["must be greater than 0"], pet.errors[:age]

  	pet.age = 0
  	assert pet.invalid?
  	assert_equal ["must be greater than 0"], pet.errors[:age]

  	pet.age = 1
  	assert pet.valid?
  end

end
