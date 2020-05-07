class TasksController < ApplicationController

    def index
        tasks = Task.all

        render json: tasks, except: [:created_at, :updated_at]
    end

    def create
        task = Task.create(to_do: params[:to_do], user_id: params[:user_id])

        render json: task, except: [:created_at, :updated_at]
    end 

    # def show
    #     tasks = Task.all 

    #     render json: tasks, except: [:created_at, :updated_at]
    # end 
end
