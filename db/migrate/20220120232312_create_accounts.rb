class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :user
      t.references :exchange
      t.references :coin
      t.float :coin_quantity
      t.timestamps
    end
  end
end
