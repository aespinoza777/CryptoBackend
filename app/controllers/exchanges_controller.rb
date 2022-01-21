class ExchangesController < ApplicationController
    skip_before_action :authorized
    def index   
        exchanges = Exchange.all
        render json: exchanges
    end
end