class ExchangesController < ApplicationController
    def index   
        exchanges = Exchange.all
        render json: exchanges
    end
end