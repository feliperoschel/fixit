class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.float :total_price
      t.date :start_date
      t.date :end_date
      t.string :location
      t.references :user, foreign_key: true
      t.references :painting, foreign_key: true

      t.timestamps
    end
  end
end
