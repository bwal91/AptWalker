class ChangeApt < ActiveRecord::Migration[5.0]
  def change
  	remove_column :apartments, :city
  	remove_column :apartments, :state
  	remove_column :apartments, :zip
  end
end
