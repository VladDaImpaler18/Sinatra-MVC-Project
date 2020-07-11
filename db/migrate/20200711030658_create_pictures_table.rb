class CreatePicturesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :filename
      t.string :caption
      t.text :description
      #t.integer :tagged_id #pets included but do not own picture. FUTURE IDEA
    end
  end
end


