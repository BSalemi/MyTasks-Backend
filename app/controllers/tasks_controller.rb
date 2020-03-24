class TasksController < ApplicationController

    def index
        tasks = Task.all

        render json: tasks, except: [:created_at, :updated_at]
    end
end
