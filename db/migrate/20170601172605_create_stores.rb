class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :city
      t.string :distance
      t.string :phone
      t.string :type

      t.timestamps
    end
  end
end
