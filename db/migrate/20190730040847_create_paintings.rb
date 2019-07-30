class CreatePaintings < ActiveRecord::Migration[5.2]
  def change
    create_table :paintings do |t|
      t.text :title
      t.text :description
      t.text :category
      t.integer :price
      t.string :photo
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
