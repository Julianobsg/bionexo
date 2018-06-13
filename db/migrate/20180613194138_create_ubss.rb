class CreateUbss < ActiveRecord::Migration[5.2]
  def change
    create_table :ubss do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :phone
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.integer :size
      t.integer :adaptation_for_senior
      t.integer :medical_equipment
      t.integer :medicine

      t.timestamps
    end
  end
end
