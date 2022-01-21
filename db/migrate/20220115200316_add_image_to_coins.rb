class AddImageToCoins < ActiveRecord::Migration[6.1]

  def change
    add_column :coins, :image, :string
  end
end
