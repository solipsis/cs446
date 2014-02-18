class CreateConsiderationItems < ActiveRecord::Migration
  def change
    create_table :consideration_items do |t|
      t.references :pet, index: true
      t.belongs_to :consideration_list, index: true

      t.timestamps
    end
  end
end
