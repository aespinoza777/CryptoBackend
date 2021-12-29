class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :ticker
      t.float :price, default: 0
      t.string :asset_id
      t.integer :marketcap_rank
      t.integer :total_supply
      t.float :total_marketcap
      t.datetime  :last_updated
      t.timestamps
    end
  end
end
