class CreateFosterAgreements < ActiveRecord::Migration
  def change
    create_table :foster_agreements do |t|
      t.references :pet, index: true

      t.timestamps
    end
  end
end
