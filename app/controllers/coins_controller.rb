class CoinsController < ApplicationController
skip_before_action :authorized
    def index
        @coins = Coin.most_popular.order(:marketcap_rank)
        render json: @coins
    end

end