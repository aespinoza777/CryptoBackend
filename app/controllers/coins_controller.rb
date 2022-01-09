class CoinsController < ApplicationController

    def index
        @coins = Coin.most_popular.order(:marketcap_rank)
        render json: @coins
    end

end