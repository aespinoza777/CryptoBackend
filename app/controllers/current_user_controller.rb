class CurrentUserController < ApplicationController
    def index
        token =  encode_token({user_id: current_user.id})
        render json: { user: UserSerializer.new(current_user).serializable_hash, token: token}, status: :created
    end
end