class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :image_url
      t.integer :age

      t.timestamps
    end
  end
end
