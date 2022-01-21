class UsersController < ApplicationController
    skip_before_action :authorized
    def create
        user = User.new(user_params)
        if user.save
            token = encode_token({user_id: user.id})
            render json: { user: UserSerializer.new(user).serializable_hash, token: token}, status: :created
        else
            render json: { error: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
        end


    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end