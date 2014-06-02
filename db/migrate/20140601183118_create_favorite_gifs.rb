class CreateFavoriteGifs < ActiveRecord::Migration
  def change
    create_table :favorite_gifs do |t|
      t.integer :gif_id
      t.integer :user_id

      t.timestamps
    end
  end
end
