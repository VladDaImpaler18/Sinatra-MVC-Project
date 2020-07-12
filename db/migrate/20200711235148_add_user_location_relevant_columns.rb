class AddUserLocationRelevantColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :fname, :string
    add_column :owners, :lname, :string
    add_column :owners, :street, :string
    add_column :owners, :phone, :string
    add_column :owners, :city, :string
    add_column :owners, :zip, :string
  end
end
