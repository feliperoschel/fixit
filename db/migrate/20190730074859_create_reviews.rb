class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.date :date
      t.text :content
      t.string :title
      t.integer :rating
      t.references :painting, foreign_key: true

      t.timestamps
    end
  end
end
