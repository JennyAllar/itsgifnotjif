class CreateGifsTable < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :url
      t.string :name
      t.string :keyword_1
      t.string :keyword_2
      t.string :keyword_3
    end
  end
end