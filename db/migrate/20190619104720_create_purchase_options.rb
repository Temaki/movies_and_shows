class CreatePurchaseOptions < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE purchase_option_video_quality_type AS ENUM ('SD', 'HD');
    SQL
    create_table :purchase_options do |t|
      t.references :purchaseable, polymorphic: true, index: true
      t.column :video_quality, :purchase_option_video_quality_type
      t.monetize :price
      t.timestamps
    end
  end

  def down
    drop_table :purchase_options
    execute <<-SQL
      DROP TYPE purchase_option_video_quality_type;
    SQL
  end
end
