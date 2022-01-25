class Account < ApplicationRecord

    belongs_to :user
    belongs_to :coin
    belongs_to :exchange

    def price 
        coin.price * coin_quantity
    end

end

