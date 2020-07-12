class AddProfilePicToPetsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :profile, :integer 
  end
end
