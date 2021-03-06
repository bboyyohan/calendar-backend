class TasksController < ApplicationController
    def index 
        tasks = Task.all 
        render json: tasks
    end
    
    def create
        new_task = Task.create(task_params)

        render json: new_task.to_json
    end

    def destroy 
        task = Task.find(params[:id])
        task.destroy
    end 

    private
    def task_params
      params.require(:task).permit(:title, :date, :start_time, :end_time, :description, :completion, :user_id)
    end

end
