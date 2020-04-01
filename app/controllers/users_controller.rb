class UsersController < ApplicationController

    def create
        user = User.new(email_address: params[:emailAddress], username: params[:username], password: params[:password], password_confirmation: params[:passwordConfirm])
        
        if user.valid? 
            user.save
            render json: user, :include => {
                tasks: {
                    except: [:created_at, :updated_at] 
                },
            }, except: [:created_at, :updated_at]
        else
            render json: {message: "An error occurred. Please check that all fields are entered correctly."}
    end


    private 

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end 
end
