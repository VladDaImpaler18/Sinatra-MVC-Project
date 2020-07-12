class AddStateToOwnersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :state, :string
  end
end
