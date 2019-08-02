class AddPhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo, :string, default: "image/upload/v1564732079/iulfmkvfv2gzx59x0uaj.jpg"
  end
end
