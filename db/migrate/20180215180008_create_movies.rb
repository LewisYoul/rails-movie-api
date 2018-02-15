class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :poster_path
      t.string :release_date
      t.float :vote_average

      t.timestamps
    end
  end
end
