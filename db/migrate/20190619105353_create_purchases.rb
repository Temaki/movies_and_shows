class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user, index: true
      t.references :purchase_option, index: true
      t.monetize :price
      t.timestamps
    end
  end
end
