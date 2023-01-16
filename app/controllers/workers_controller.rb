class WorkersController < ApplicationController
    def new 
        @worker = Worker.new
    end

    def create
        byebug
        @user = User.find(params[:user_id])
        @task = Task.find(params[:task_id])
        @worker = @task.workers.create(worker_params)
        if @worker.save
            flash[:notice]= "Task Alloted Successfully"
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end


    private

    def worker_params
        params.require(:worker).permit(:name,:email,:address,:age,:mobileno)
    end

end
