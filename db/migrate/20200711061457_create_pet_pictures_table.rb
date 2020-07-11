class CreatePetPicturesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_pictures do |t|
      t.integer :pet_id
      t.integer :picture_id
    end
  end
end
