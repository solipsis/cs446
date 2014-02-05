class CreatePetSelectors < ActiveRecord::Migration
  def change
    create_table :pet_selectors do |t|

      t.timestamps
    end
  end
end
