class CreatePicturesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :filename
      t.string :caption
      t.text :description
      t.integer dog_id 
  end
end
