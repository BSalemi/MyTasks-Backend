
class TasksController < ApplicationController

    def index
        tasks = Task.all

        render json: tasks, except: [:created_at, :updated_at]
    end

    def create
        task = Task.create(to_do: params[:task], user_id: params[:user_id])
        if params[:dueDate].size === 10
            task.due_date = params[:dueDate]
            task.save
        else 
            task.due_date = nil
            task.save
        end
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

        render json: task, except: [:created_at, :updated_at]

    end 

    def destroy
        task = Task.find(params[:id])
        user = task.user_id
        task.destroy

        tasks = Task.select{|task| task.user_id === user}

        render json: tasks, except: [:created_at, :updated_at]
    end
end
