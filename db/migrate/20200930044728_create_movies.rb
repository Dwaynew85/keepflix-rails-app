class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :stars
      t.string :trailer_link
      t.string :genres # change to model for sorting
      t.string :rating
      t.string :runtime
      t.string :release_date
      t.text :summary
      t.text :image_url
      t.text :link
      t.integer :user_id # comment model too?

      t.timestamps null: false
    end
  end
end
