class AccountsController < ApplicationController

    def index
        accounts = current_user.accounts
        render json: accounts
    end

    def create
        account = current_user.accounts.create(account_params)
        render json: account, status: :created
    end

    def update
        account = current_user.accounts.find(params[:id])
        account.update(account_params)
        render json: account
        
    end

    private

    def account_params
        params.require(:account).permit( :exchange_id, :coin_id, :coin_quantity)
    end


end