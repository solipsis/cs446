class CreateConsiderationLists < ActiveRecord::Migration
  def change
    create_table :consideration_lists do |t|

      t.timestamps
    end
  end
end
