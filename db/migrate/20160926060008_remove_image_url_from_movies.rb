class RemoveImageFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :image, :string
  end
end
