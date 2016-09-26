class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.datetime :release_date
      t.string :director
      t.integer :runtime_in_minutes
      t.text :description
      t.string :poster_image_url

      t.timestamps
    end
  end
end
