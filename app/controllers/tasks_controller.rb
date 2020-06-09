
class TasksController < ApplicationController

    def index
        tasks = Task.all

        render json: tasks, except: [:created_at, :updated_at]
    end

    def create
        task = Task.create(to_do: params[:to_do], user_id: params[:user_id])

        render json: task, except: [:created_at, :updated_at]
    end 

    def show
        task = Task.find_by(id: params[:id])
    end 

    def complete
        task = Task.find(params[:id])
        id = task.id 
        task.completed = true 
        task.save
        # byebug
        render json: task, except: [:created_at, :updated_at]
    end 

    def undo
        task = Task.find(params[:id])
        id = task.id
        
        task.completed = false 

        render json: id, except: [:created_at, :updated_at]

    end 

end
