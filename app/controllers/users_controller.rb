class UsersController < ApplicationController

    def index 
        users = User.all 

        render json: users, except: [:created_at, :updated_at]
    end 

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
    end

    def login
        user = User.find_by(username: params[:username], password: [params[:password]])

        if user 
            render json: user, :include => {
                tasks: {
                    except: [:created_at, :updated_at]
                }, except: [:created_at, :updated_at]
            }
        else 
            render json: {message: "Incorrect Username or Password"}
        end 

    end 


    private 

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end 
end
