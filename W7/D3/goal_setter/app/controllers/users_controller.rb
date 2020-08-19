class UsersController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = @users.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end