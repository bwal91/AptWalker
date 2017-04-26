class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :street_add
      t.string :city
      t.string :state
      t.string :zip
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
