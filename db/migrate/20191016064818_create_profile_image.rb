class CreateProfileImage < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_image do |t|
      t.text :user_name
      t.text :profile_image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
