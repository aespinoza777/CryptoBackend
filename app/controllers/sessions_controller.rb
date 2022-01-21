class SessionsController < ApplicationController
    skip_before_action :authorized
    def create
        user = User.find_by(email: user_params[:email])
        if user && user.authenticate(user_params[:password])
            token = encode_token({user_id: user.id})
            render json: { user: UserSerializer.new(user).serializable_hash, token: token}, status: :created
        else
            render json: { error: "invlaid email and/or password"}, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end