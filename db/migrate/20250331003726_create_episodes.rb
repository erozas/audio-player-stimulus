class CreateEpisodes < ActiveRecord::Migration[8.0]
  def change
    create_table :episodes do |t|
      t.string :name
      t.integer :duration
      t.string :slug
      t.datetime :published_at

      t.timestamps
    end
    add_index :episodes, :slug, unique: true
  end
end
