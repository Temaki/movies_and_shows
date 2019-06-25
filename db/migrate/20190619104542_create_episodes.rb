class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.references :season, index: true
      t.integer :number
      t.string :title
      t.text :plot
      t.timestamps
    end
  end
end
