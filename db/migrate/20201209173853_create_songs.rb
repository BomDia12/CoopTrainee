class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.datetime :releasedate
      t.boolean :explicit
      t.references :artist, foreign_key: true, null: false

      t.timestamps
    end
  end
end
